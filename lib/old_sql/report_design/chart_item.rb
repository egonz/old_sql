module OldSql
  module ReportDesign
    class ChartItem
      attr_accessor :chart_data, :key
      
      def initialize(slice)
        @key = slice['title']
        @data = slice['data']
        @chart_data = []
        
        @data.split(" ").each {|chart_data| @chart_data << ChartData.new(chart_data)}
      end
      
      def expression?
        if @chart_data.count>1
          return true
        else
          return false
        end
      end
    end
  end
end