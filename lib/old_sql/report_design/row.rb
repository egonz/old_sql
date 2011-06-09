module OldSql
  module ReportDesign
    class Row
      attr_accessor :data, :cells
      
      def initialize(value)
        @data = value
        @cells = []
        
        @data.split(",").each do |cell|
          @cells << Cell.new(cell)
        end
      end
      
      def cell(index)
        @cells[index]
      end
    end
  end
end