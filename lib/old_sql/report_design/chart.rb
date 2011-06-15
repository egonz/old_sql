module OldSql
  module ReportDesign
    class Chart
      attr_accessor :type, :items
      
      def initialize(value = [])
        @items = value
      end
      
      def type new_type = nil
        @type = new_type unless new_type.nil?
        @type
      end
      
      def add(slice)
        @items << ChartItem.new(slice)
      end
      
      def item(index)
        @items[index]
      end
    end
  end
end