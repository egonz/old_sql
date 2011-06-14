module OldSql
  module ReportDesign
    class ChartData
      attr_accessor :value, :type
      
      COLUMN = 1
      OPERATOR = 3
      NUMERIC_LITERAL = 4
      
      def initialize(value)
        @value = value
        set_type
      end
      
      private
      
      def set_type
        @type = case @value[0]
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