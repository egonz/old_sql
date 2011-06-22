module OldSql
  module ReportDesign
    class Cell
      attr_accessor :cell_data, :cell
      
      def initialize(value)
        @cell = value.strip
        @cell_data = []
        
        # Check if cell is a label
        if @cell[0] =~ /['"]/
          @cell_data << CellData.new(@cell)
        else
          value.split(" ").each {|cell_data| @cell_data << CellData.new(cell_data)}
        end
      end
      
      def expression?
        if @cell_data.count>1
          return true
        else
          return false
        end
      end
    end
  end
end