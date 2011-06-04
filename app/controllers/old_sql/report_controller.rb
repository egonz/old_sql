require 'csv'

#
# TODO:
# 1. Reduce the datagrid and print views to a single view.
#    The colnames can be defined in the reports.yml config file.
#    (Completed on 5-24-2011)
# 2. Create a generic SQL parse method.
#    (Completed on 5-24-2011)
# 3. Convert to a gem. This class will be overridden to implement
#    parse methods.
# 4. Add export to CSV
#    (Completed on 5-24-2011)
# 5. I think we should move the parse methods to a lib class.
#    The parse class name could be defined in the reports.yml file.
#    (Completed on 5-24-2011)
# 6. Try and implement jqgrid sort and search methods.
#    This should be done in the sql files by passing the params
#    from jqgrid into them.
# 7. Remove rails_admin dependencies
# 8. Add Devise support
# 9. Rewrite jqgrid using JQuery 
#

module OldSql
  class ReportController < ApplicationController
    before_filter :_init
    before_filter :_reports

    helper_method :jqgrid_field_list

    ROUND_PRECISION = 2
    BASE_PROCESSOR = "base"

    def index
      #render :layout => 'rails_admin/dashboard'
    end
    
    def datagrid
      @start_date = params[:start_date]
      @end_date = params[:end_date]
      @generation = params[:generation]
      @report_name = params[:report]
      @report_sql = params[:report_sql]
      
      render :template => "rails_admin/db_report/datagrid.html.erb"
    end
    
    def query
      @start_date = params[:start_date]
      @end_date = params[:end_date]
      @generation = params[:generation]
      @report_name = params[:report]
      @report_sql = params[:report_sql].downcase
      @report_sql_orig = params[:report_sql].downcase
      
      if !@generation.nil? && @generation.to_i >= 0
        @report_sql << "_gen_#{@generation}"
      end
      
      logger.info "REPORT: #{@report_name}"
      logger.info "REPORT SQL: #{@report_sql}"
      logger.info "START_DATE: #{@start_date}"
      logger.info "END_DATE: #{@end_date}"
      logger.info "GENERATION: #{@generation}"
      
      processor = load_processor(@report_name)
      @report = processor.execute_query(@report_sql,@start_date,@end_date,query_vars(@report_name))
      
      respond_to do |format|
        format.json { render :json => @report.to_json}
        format.xml { render :xml => @report.to_xml }
        format.csv {
          csv_string = CSV.generate do |csv|
            # header row
            csv << ['Start Date', @start_date,'End Date', @end_date]
            csv << @reports[@report_name]['fields']

            # data rows
            @report[:rows].each do |row|
              rec = []
              row[:cell].each do |cell|
                rec << Sanitize.clean(cell.to_s)
              end
              csv << rec
            end
          end

          send_data csv_string,
            :type => 'text/csv; charset=iso-8859-1; header=present',
            :disposition => "attachment; filename=#{@report_sql}_#{@start_date.gsub(' ','_')}_#{@end_date.gsub(' ','_')}.csv"
        }
      end
    end
    
    def print
      @start_date = params[:start_date]
      @end_date = params[:end_date]
      @generation = params[:generation]
      @report_name = params[:report]
      @desc = params[:desc]
      @report_sql = params[:report_sql].downcase
      @report_sql_orig = params[:report_sql].downcase
      
      if !@generation.nil? && @generation.to_i >= 0
        @report_sql << "_gen_#{@generation}"
      end
      
      logger.info "REPORT: #{@report_name}"
      logger.info "REPORT SQL: #{@report_sql}"
      logger.info "START_DATE: #{@start_date}"
      logger.info "END_DATE: #{@end_date}"
      logger.info "GENERATION: #{@generation}"
      
      processor = load_processor(@report_name)
      @report = processor.execute_query(@report_sql,@start_date,@end_date,query_vars(@report_name))
      
      render :layout => 'rails_admin/db_report_print', :template => "rails_admin/db_report/print.html.erb"
    end
    

    private
      def _init
		#todo add Devise support
        #@authorization_adapter.authorize(:index) if @authorization_adapter
        @page_name = t("admin.report.pagename")
        @page_type = "report"
        @host = self.request.host
        @port = self.request.port
      end
      
      def _reports
        template = File.read("#{Rails.root}/config/reports.yml")
        @reports = YAML.load(Erubis::Eruby.new(template).result)
      end
      
      def load_processor report
        processor = nil
        begin
          #todo get processor name from @reports
          
          if !@reports[report]['processor'].nil?
            logger.info "Loading Processor report_processor/#{@reports[report]['processor'].downcase}"
            require "report_processor/#{@reports[report]['processor'].downcase}"
            processor=eval("ReportProcessor::#{@reports[report]['processor'].gsub("_","")}").new
          
          else
            logger.info "Loading Processor report_processor/#{BASE_PROCESSOR}"
            require "report_processor/#{BASE_PROCESSOR}"
            processor=eval("ReportProcessor::#{BASE_PROCESSOR}.capitalize").new
          end 
        rescue
          logger.info "Loading Processor report_processor/#{BASE_PROCESSOR}"
          require "report_processor/#{BASE_PROCESSOR}"
          processor=eval("ReportProcessor::#{BASE_PROCESSOR}.capitalize").new
        end
        
        processor
      end
      
      def jqgrid_field_list
        @fields = []
        field_num = 1

        @reports[@report_name]['fields'].each do |field|
          if field_num == 1
            @fields << { :field => "cell_#{field_num}", :label => field }
          else
            @fields << { :field => "cell_#{field_num}", :label => field, :align => "center" }
          end
          field_num+=1
        end
        
        @fields
      end
      
      def query_vars report
        query_vars = @reports[report]['query_vars']
        if !query_vars.nil? && query_vars.size > 0
          return query_vars[0]
        else
          return nil
        end
      end
  end
end

