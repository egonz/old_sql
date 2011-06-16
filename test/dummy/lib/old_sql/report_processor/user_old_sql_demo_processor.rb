require 'old_sql/report_processor/base'

module OldSql
  module ReportProcessor
    class UserOldSqlDemoProcessor < OldSql::ReportProcessor::Base
   
      def parse(resultset)
        Rails.logger.debug "REC: #{@rec}"
     
        add_row([@rec['id'], @rec['name']])
        add_row(['Totals', '...'])
     
        @data
      end
    end
  end
end