require 'csv'

module OldSql
  class ReportController < ApplicationController
    before_filter :authenticate_user!
    before_filter :ensure_old_sql_admin!
    before_filter :_init
    before_filter :_reports

    helper_method :jqgrid_col_model
    helper_method :jqgrid_col_names

    layout "old_sql/report.html.erb"
    
    BASE_PROCESSOR = "base"

    def index
    end
    
    def datagrid
      @start_date = params[:start_date]
      @end_date = params[:end_date]
      @generation = params[:generation]
      @report_name = params[:report]
      @report_sql = params[:report_sql]
      
      render :template => "old_sql/report/datagrid.html.erb"
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
      @report = processor.execute_query(@report_sql,@start_date,@end_date,query_vars(@report_name),@reports[@report_name]['report_design'])
      
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
      
      render :template => "old_sql/report/print.html.erb"
    end
    

    private
      def ensure_old_sql_admin!
        raise CanCan::AccessDenied unless current_user.old_sql_admin?
      end
      
      def _init
		    #todo add Devise support
        #@authorization_adapter.authorize(:index) if @authorization_adapter
        @page_name = t("old_sql.report.pagename")
        @host = self.request.host
        @port = self.request.port
      end
      
      def _reports
        template = File.read("#{Rails.root}/config/old_sql/reports.yml")
        @reports = YAML.load(Erubis::Eruby.new(template).result)
      end
      
      def load_processor report
        processor = nil
        begin
          #todo get processor name from @reports
          
          if !@reports[report]['processor'].nil?
            logger.info "Loading Processor old_sql/report_processor/#{@reports[report]['processor'].downcase}"
            require "old_sql/report_processor/#{@reports[report]['processor'].downcase}"
            processor=eval("OldSql::ReportProcessor::#{@reports[report]['processor'].gsub("_","")}").new
          
          else
            logger.info "Loading Processor old_sql/report_processor/#{BASE_PROCESSOR}"
            require "old_sql/report_processor/#{BASE_PROCESSOR}"
            processor=eval("OldSql::ReportProcessor::#{BASE_PROCESSOR.capitalize}").new
          end 
        rescue Exception=>e
          logger.error e.message
          logger.info "Loading Processor old_sql/report_processor/#{BASE_PROCESSOR}"
          require "old_sql/report_processor/#{BASE_PROCESSOR}"
          processor=eval("OldSql::ReportProcessor::#{BASE_PROCESSOR.capitalize}").new
        end
        
        processor
      end
      
      def jqgrid_col_model
        @fields = []
        field_num = 1
        
        # [
        #   {name:'id',index:'id', width:55},
        #   {name:'invdate',index:'invdate', width:90, editable:true},
        #   {name:'name',index:'name', width:100,editable:true},
        #   {name:'amount',index:'amount', width:80, align:"right",editable:true},
        #   {name:'tax',index:'tax', width:80, align:"right",editable:true},    
        #   {name:'total',index:'total', width:80,align:"right",editable:true},   
        #   {name:'note',index:'note', width:150, sortable:false,editable:true}   
        # ]

        @reports[@report_name]['fields'].each do |field|
          if field_num == 1
            @fields << { :name=>field }
          else
            @fields << { :name=>field, :align=>"center" }
          end
          field_num+=1
        end
        
        @fields.to_json.html_safe
      end
      
      def jqgrid_col_names
        json = @reports[@report_name]['fields'].to_json
        json.html_safe
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

