require 'old_sql/report_design/parser'
require 'old_sql/report_design/model'
require 'old_sql/report_design/row'
require 'old_sql/report_design/cell'
require 'old_sql/report_design/cell_data'

module OldSql
  module ReportProcessor
    class Base
    
      ROUND_PRECISION = 2
    
      def execute_query(report_sql,start_date,end_date,query_vars,design=nil)
        vars = {:start_date => start_date, :end_date => end_date}
      
        if !query_vars.nil?
          vars = vars.merge query_vars
        end
      
        template = File.read("#{Rails.root}/config/old_sql/report_sql/#{report_sql}.erb")
        sql = Erubis::Eruby.new(template).result(vars)
      
        Rails.logger.debug sql
      
        db = nil
      
        begin
          #todo change to a reporting db
          db = ActiveRecord::Base.connection();
        
          @resultset = []
          rec = db.select_all(sql)
          rec.each do |row|
            @resultset << row
          end
        rescue
          #todo log error
        end
        
        if design
          parse_design(design, @resultset)
        else
          parse(@resultset)
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
        Rails.logger.info "PARSING DESIGN DOCUMENT #{design}.csv"
        model = OldSql::ReportDesign::Parser.read_file("#{design}.csv")
        
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
                  report_row << @rec[cd.data]
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
      
      def eval_expression expression
        begin
          result = eval(expression)
          if result.to_s!="Infinity"
            return result
          else
            return "0"
          end
        rescue
          return "0"
        end
      end
    
      def new_data(page=1, total=1, records=1)
        @id = 0
        @data = {}
        @data[:page]=page
        @data[:total]=total
        @data[:records]=records
        @data[:rows] = []
      end
  
      def add_row(title = nil, cell_data = [], id = @id+1)        
        if !title.nil?
          cell_data.unshift "<b>#{title}</b>"
        end
    
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
    end
  end
end