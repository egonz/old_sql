module OldSql
  module ReportDesign
    class CellData
      attr_accessor :data, :type
      
      COLUMN = 1
      LABEL = 2
      OPERATOR = 3
      NUMERIC_LITERAL = 4
      
      def initialize(value)
        @data = value
        set_type
      end
      
      private
      
      def set_type
        @type = case @data[0]
                when /['"]/
                  LABEL
                when /[\/*+-\Q()]/
                  OPERATOR
                when /[0-9]/
                  NUMERIC_LITERAL
                else
                  COLUMN
                end
      end
    end
  end
end