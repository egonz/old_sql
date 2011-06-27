require 'csv'

module OldSql
  class ReportController < ApplicationController
    before_filter :"authenticate_#{OldSql.devise_model}!"
    before_filter :ensure_old_sql_admin!
    before_filter :_init
    before_filter :_reports

    helper_method :jqgrid_col_model
    helper_method :jqgrid_col_names
    helper_method :strip_html
    helper_method :chart_type
    helper_method :chart_data
    helper_method :db_list

    layout "old_sql/report.html.erb"

    BASE_PROCESSOR = "base"

    def index
      @report_view = OldSql.default_report_view
    end

    def jqgrid
      @start_date = params[:start_date]
      @end_date = params[:end_date]
      @report_name = params[:report]
      @report_sql = params[:report_sql]
      @query = params[:query]
      @db = params[:db]
      @caption = params[:caption] 
      w = params[:w]
      
      #todo allow these to be overridden in the report config
      @row_num = OldSql.jqgrid_row_num
      @width =  w.nil? ? OldSql.report_width : w
      @height = OldSql.report_height

      render :template => "old_sql/report/jqgrid.html.erb"
    end

    def table
      @start_date = params[:start_date]
      @end_date = params[:end_date]
      @report_name = params[:report]
      @report_sql = params[:report_sql].downcase
      @report_sql_orig = params[:report_sql].downcase

      @width = OldSql.report_width
      @height = OldSql.report_height

      processor = load_base_processor
      @report = processor.execute_query(@reports[@report_name],@start_date,@end_date,query_vars(@report_name))

      render :template => "old_sql/report/table.html.erb"
    end

    def chart
      @start_date = params[:start_date]
      @end_date = params[:end_date]
      @report_name = params[:report]
      @report_sql = params[:report_sql].downcase
      @report_sql_orig = params[:report_sql].downcase

      @width = 800
      @height = 500
      @google_chart_colors = google_chart_colors

      processor = load_base_processor
      @report = processor.execute_query(@reports[@report_name],@start_date,@end_date,query_vars(@report_name))

      render :layout => 'old_sql/chart.html.erb', :template => "old_sql/report/chart.html.erb"
    end

    def print
      @start_date = params[:start_date]
      @end_date = params[:end_date]
      @report_name = params[:report]
      @desc = params[:desc]
      @report_sql = params[:report_sql].downcase
      @report_sql_orig = params[:report_sql].downcase

      processor = load_base_processor
      @report = processor.execute_query(@reports[@report_name],@start_date,@end_date,query_vars(@report_name))

      render :template => "old_sql/report/print.html.erb"
    end
    
    #ajax call
    def query
      start_date = params[:start_date]
      end_date = params[:end_date]
      report_name = params[:report]
      report_sql = params[:report_sql].downcase
      report_sql_orig = params[:report_sql].downcase
      query = params[:query]
      db = params[:db]

      @processor = load_base_processor
      report = @processor.execute_query(@reports[report_name],start_date,end_date,query_vars(report_name),query,db)

      respond_to do |format|
        format.json { render :json => report.to_json}
        format.xml { render :xml => report.to_xml }
        format.csv {
          csv_string = CSV.generate do |csv|
            # header row
            csv << ['Start Date', start_date,'End Date', end_date]
            csv << @reports[report_name]['fields']

            # data rows
            report[:rows].each do |row|
              rec = []
              row[:cell].each do |cell|
                rec << strip_html(cell.to_s).gsub("\n","")
              end
              csv << rec
            end
          end

          send_data csv_string,
          :type => 'text/csv; charset=iso-8859-1; header=present',
          :disposition => "attachment; filename=#{report_sql}_#{start_date.gsub(' ','_')}_#{end_date.gsub(' ','_')}.csv"
        }
      end
    end


    private
    def ensure_old_sql_admin!
      render_error(Exception.new "Old SQL Access Denied.") unless eval("current_user.old_sql_admin?")
    end

    def _init
      @host = self.request.host
      @port = self.request.port
    end

    def _reports
      template = File.read("#{Rails.root}/config/old_sql/reports.yml")
      @reports = YAML.load(Erubis::Eruby.new(template).result)
    end

    def load_base_processor
      require "old_sql/report_processor/base"
      OldSql::ReportProcessor::Base.new
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
      
      qf = query_fields
      return if qf.nil?

      qf.each do |field|
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
      json = query_fields.to_json
      json.html_safe
    end
    
    def query_fields
      fields = load_base_processor.fields(@reports[@report_name],@start_date,@end_date,query_vars(@report_name),@query,@db)
      logger.info "FIELDS #{fields}"
      fields
    end

    def query_vars report
      return nil if report.nil? || report.length<=0
      query_vars = @reports[report]['query_vars']
      if !query_vars.nil? && query_vars.size > 0
        return query_vars[0]
      else
        return nil
      end
    end

    def render_error(exception)
      logger.error(exception)
      render :template => "old_sql/errors/401.html.erb", :status => 401
    end

    def strip_html html
      OldSql.strip_html html
    end

    def chart_data
      return nil if @report.nil?
      json = @report.values.first.to_json
      json.html_safe
    end

    def chart_type
      return nil if @report.nil?
      @report.keys.first
    end

    def google_chart_colors
      json = OldSql.google_chart_colors.to_json
      json.html_safe
    end

    def db_list
      db = []
      db << {name: Rails.env.capitalize, db_class: "active_record/base"}
    end
  end
end

