module OldSql
  module ReportDesign
    class CellData
      attr_accessor :data, :type
      
      COLUMN = 1
      LABEL = 2
      OPERATOR = 3
      
      def initialize(value)
        @data = value
        set_type
      end
      
      private
      
      def set_type
        first_char = @data[0]
        @type = case first_char
                when /['"]/
                  LABEL
                when /[\/*+]/
                  OPERATOR
                else
                  COLUMN
                end
      end
    end
  end
end