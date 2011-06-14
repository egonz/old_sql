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
    
      def execute_query(report_sql,start_date,end_date,query_vars,design=nil,sub_processor=nil)
        vars = {:start_date => start_date, :end_date => end_date}
      
        if !query_vars.nil?
          vars = vars.merge query_vars
        end
      
        template = File.read("#{Rails.root}/config/old_sql/report_sql/#{report_sql}.erb")
        sql = Erubis::Eruby.new(template).result(vars)
      
        begin
          #todo change to a reporting db
          db = ActiveRecord::Base.connection();
        
          @resultset = []
          rec = db.select_all(sql)
          rec.each do |row|
            @resultset << row
          end
        rescue Exception=>e
          #todo log error
          Rails.logger.error e
        end
        
        if design
          parse_design(design, @resultset) if design =~ /csv/
          parse_chart_design(design, @resultset) if design =~ /yml/
        else
          loaded_sub_processor = load_sub_processor(sub_processor)
          
          if loaded_sub_processor.nil?
            parse(@resultset)
          else
            @data = loaded_sub_processor.parse(@resultset)
          end
        end
        
        @data
      end
    
      def init(resultset)
        @rec = resultset[0]
        self.new_data
      end
    
      def parse(resultset)
        init(resultset)
      
        resultset.each do |r|
          cell = [] 
          r.each do |key, value|
            cell << value
          end
          add_row(nil, cell)
        end
      
        @data
      end
      
      def parse_design(design, resultset)
        init(resultset)
        
        return nil if @rec.nil?
        
        model = OldSql::ReportDesign::Parser.read_file("#{design}")
        
        init(resultset)
        
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
                  report_row << cd.data.gsub(/"/,"")
                end
              end
            end
            report_row << eval_expression(expression) unless expression.length==0
          end
          
          add_row(nil, report_row)
        end
      end
      
      def parse_chart_design(design, resultset)
        report_row = []
        @rec = resultset[0]
            
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
      
      def round(value, precision = ROUND_PRECISION)
        factor = 10.0**precision
        (value*factor).round / factor
      end
    
      def new_data(page=1, total=1, records=1)
        @id = 0
        @data = {}
        @data[:page]=page
        @data[:total]=total
        @data[:records]=records
        @data[:rows] = []
      end
  
      def add_row(cell_data = [], id = @id+1)        
        @data[:rows] << {id: id, cell: cell_data}
      end
  
      def ifnull(o)
        if !o.nil? && o != 0
          return o
        else
          return 1
        end
      end
  
      def isNumeric(s)
        Float(s) != nil rescue false
      end
      
      def load_sub_processor sub_processor
        return if sub_processor.nil?
        
        loaded_sub_processor = nil
        begin
          Rails.logger.info "Loading Processor old_sql/report_processor/#{sub_processor.downcase}"
          require "old_sql/report_processor/#{sub_processor.downcase}"
          loaded_sub_processor=eval("OldSql::ReportProcessor::#{sub_processor.gsub("_","")}").new 
        rescue Exception=>e
          Rails.logger.error e.message
        end
        
        loaded_sub_processor
      end
    end
  end
end