require 'old_sql/report_processor/base'

module OldSql
  module ReportProcessor
    class UserProcessor < OldSql::ReportProcessor::Base
   
      def parse(resultset)
        init(resultset)
     
        Rails.logger.debug "REC: #{@rec}"
     
        new_row(nil, [@rec['id'], @rec['name']])
        new_row('Totals', ['...'])
     
        @data
      end
    end
  end
end