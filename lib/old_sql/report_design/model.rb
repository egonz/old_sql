module OldSql
  module ReportDesign
    class Model
      attr_accessor :rows
      
      @rows = nil
      
      def initialize(value = [])
        @rows = value
      end
      
      def add(row)
        @rows << Row.new(row) unless row[0] == "#"
      end
      
      def row(index)
        @rows[index]
      end
    end
  end
end