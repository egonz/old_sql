module OldSql
  module ReportDesign
    class ChartItem
      attr_accessor :chart_data, :key
      
      def initialize(key, value)
        @key = key
        @value = value
        @chart_data = []
        
        @value.split(" ").each {|chart_data| @chart_data << ChartData.new(chart_data)}
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