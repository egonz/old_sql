require 'old_sql/report_design/parser'
require 'old_sql/report_design/model'
require 'old_sql/report_design/row'
require 'old_sql/report_design/cell'
require 'old_sql/report_design/cell_data'
require 'old_sql/report_design/chart_parser'
require 'old_sql/report_design/chart'
require 'old_sql/report_design/chart_item'
require 'old_sql/report_design/chart_data'

module OldSql
  module ReportProcessor
    class Base
    
      ROUND_PRECISION = OldSql.rounding_precision
    
      def execute_query(report_config, start_date, end_date, query_vars = nil, sql_query = nil, db_class = nil)
        execute(report_config, start_date, end_date, query_vars, sql_query, db_class)
        
        return nil if @rec.nil?
        return parse(@resultset) if report_config.nil?
        
        @report_type = report_config['report_view']
        report_design = report_config['report_design']
        
        if report_design
          parse_design(report_design, @resultset) if report_design =~ /csv/
          parse_chart_design(report_design, @resultset) if report_design =~ /yml/
        else
          loaded_sub_processor = load_sub_processor(report_config['report_processor'])
          
          if loaded_sub_processor.nil?
            parse(@resultset)
          else
            @data = loaded_sub_processor.parse(@resultset)
          end
        end
        
        @data
      end
      
      def fields(report_config, start_date, end_date, query_vars = nil, sql_query = nil, db_class = nil)
        return report_config['fields'] unless report_config.nil?
        
        execute(report_config, start_date, end_date, query_vars, sql_query, db_class)
        return humanize_fields(@rec.keys) unless @rec.nil?
        
        nil
      end
      
      protected
      
      def add_row(cell_data = [], id = @id+1)        
        @data[:rows] << {id: id, cell: cell_data}
      end
      
      def round(value, precision = ROUND_PRECISION)
        factor = 10.0**precision
        (value*factor).round / factor
      end
  
      def isNumeric(s)
        Float(s) != nil rescue false
      end
      
      private
      
      def execute(report_config, start_date, end_date, query_vars = nil, sql_query = nil, db_class = nil)
        if !sql_query.nil? && sql_query.length > 0
          sql = sql_query.gsub("\n"," ")
        else
          sql = load_sql(report_config['report_sql'], start_date, end_date, query_vars)
        end
        
        query(sql, report_config, db_class)
        
        return nil if @resultset.nil?
        
        init
      end
      
      def humanize_fields(fields)
        humanized_fields = []
        fields.each do |field|
          humanized_field = ""
          field.split("_").each {|f| humanized_field << "#{f.capitalize} "}
          humanized_fields << humanized_field.rstrip
        end
        humanized_fields
      end
      
      def load_sql(report_sql, start_date, end_date, query_vars)
        vars = {:start_date => start_date, :end_date => end_date}
      
        if !query_vars.nil?
          vars = vars.merge query_vars
        end
      
        template = File.read("#{Rails.root}/config/old_sql/report_sql/#{report_sql}.erb")
        sql = Erubis::Eruby.new(template).result(vars)
      end
      
      def query sql, report_config, db_class
        begin
          #todo change to a reporting db
          db = db_connection(report_config, db_class)
        
          @resultset = []
          rec = db.connection.select_all(sql)
          rec.each do |row|
            @resultset << row
          end
        rescue Exception=>e
          Rails.logger.error e
        end
        
        @resultset
      end
      
      def db_connection report_config, db_class
        if !report_config.nil? && report_db = report_config['report_db']
          db = load_db_connection(report_db)
        elsif !db_class.nil? && db_class.length > 0
          db = load_db_connection(db_class)
        else
          db = ActiveRecord::Base;
        end
        
        db
      end
      
      def load_db_connection db_class_path
        require db_class_path
    
        db_class_name = ""
        first = true
    
        db_class_path.split("/").each do |path|
          db_class_name << "::" unless first
          path.split("_").each {|c| db_class_name << c.capitalize }
          first = false
        end
    
        db=eval(db_class_name)
      end
      
      def load_sub_processor sub_processor
        return if sub_processor.nil?
        
        loaded_sub_processor = nil
        begin
          require "old_sql/report_processor/#{sub_processor.downcase}"
          loaded_sub_processor=eval("OldSql::ReportProcessor::#{sub_processor.gsub("_","")}").new 
        rescue Exception=>e
          Rails.logger.error e.message
        end
        
        loaded_sub_processor
      end
      
      def init
        @rec = @resultset[0]
        @id = 0
        @data = {}
        @data[:rows] = []
        
        init_jqgrid_data
      end
      
      def init_jqgrid_data(page=1, total=1, records=1)
        @data[:page]=page
        @data[:total]=total
        @data[:records]=records
      end
      
    
      def parse(resultset)
        init_jqgrid_data
        
        resultset.each do |r|
          cell = [] 
          r.each do |key, value|
            cell << value
          end
          add_row(cell)
        end
      
        @data
      end
      
      def parse_design(design, resultset)
        model = OldSql::ReportDesign::Parser.read_file("#{design}")
        
        model.rows.each do |row|
          report_row = []
          row.cells.each do |cell|
            expression = ""
            cell.cell_data.each do |cd|
              if cell.expression?
                if cd.type == OldSql::ReportDesign::CellData::COLUMN
                  expression << @rec[cd.data].to_s
                elsif cd.type == OldSql::ReportDesign::CellData::OPERATOR ||
                      cd.type == OldSql::ReportDesign::CellData::NUMERIC_LITERAL
                  expression << cd.data
                end
              else
                if cd.type == OldSql::ReportDesign::CellData::COLUMN
                  result = @rec[cd.data]
                  if OldSql.round_report_values
                    result = round(result.to_f, OldSql.rounding_precision)
                  end
                  report_row << result
                elsif  cd.type == OldSql::ReportDesign::CellData::LABEL
                  label = cd.data.gsub(/"/,"")
                  label = bold(label) if label.length == label[/[A-Z\s]*/].length
                  report_row << label
                end
              end
            end
            report_row << eval_expression(expression) unless expression.length==0
          end
          
          add_row(report_row)
        end
      end
      
      def parse_chart_design(design, resultset)
        report_row = []
        
        chart = OldSql::ReportDesign::ChartParser.read_file("#{design}")
        
        chart.items.each do |item|
          key = item.key
          expression = ""
          
          item.chart_data.each do |data|
            if item.expression?
              if data.type == OldSql::ReportDesign::ChartData::COLUMN
                expression << @rec[data.value].to_s
              elsif data.type == OldSql::ReportDesign::ChartData::OPERATOR ||
                    data.type == OldSql::ReportDesign::ChartData::NUMERIC_LITERAL
                expression << data.value
              end
            else
              if data.type == OldSql::ReportDesign::ChartData::COLUMN
                result = @rec[data.value]
                if OldSql.round_report_values
                  result = round(result.to_f, OldSql.rounding_precision)
                end
                report_row << [key,result]
              end
            end
          end
          report_row << [key,eval_expression(expression)] unless expression.length==0
        end
        
        @data = {chart.type=>report_row}
      end
      
      def eval_expression expression
        result = 0.0
        begin
          result = eval(expression)
        rescue ZeroDivisionError => e
        rescue Exception => e
        end
        
        if result.class == Float || result.class == Fixnum
          result = result.to_s
        end
        
        if result == "Infinity" || result == "NaN"
          result = 0.0
        elsif OldSql.round_report_values
          result = round(result.to_f, OldSql.rounding_precision)
        end
        
        result
      end
      
      def bold(label)
        _label = ""
        _label << "<span style='font-weight:bold'>"
        _label << capitalize(label)
        _label << "</span>"
        _label.html_safe
      end
      
      def capitalize(label)
        _label = ""
        first = true
        
        label.split(/\s/).each do |s|
          _label << " " unless first 
          _label << s.capitalize
          first = false
        end
        
        _label
      end
    end
  end
end