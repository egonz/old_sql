module OldSql
  module ReportProcessor
    class Base
    
      ROUND_PRECISION = 2
      
      def hello_world
        puts "Hello World"
      end
    
      def execute_query(report_sql,start_date,end_date,query_vars)
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
      
        parse(@resultset)
      
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
          new_row(nil, cell)
        end
      
        @data
      end
    
      def new_data(page=1, total=1, records=1)
        @id = 0
        @data = {}
        @data[:page]=page
        @data[:total]=total
        @data[:records]=records
        @data[:rows] = []
      end
  
      def new_row(title = nil, cell_data = [], id = @id+1)        
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