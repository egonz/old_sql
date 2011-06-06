require 'report_processor/base'

module ReportProcessor
  class DigestPerm < ReportProcessor::Base
    
    def parse(resultset)
      init(resultset)
      
      Rails.logger.debug "REC: #{@rec}"
      
      new_row("Total Installs", [@rec[:total_installs]])
      new_row("Granted Digest Perm", [@rec[:granted_weekly_digest_perm]])
      new_row("Percent Granted", [@rec[:percent_granted_digest]])
      
      @data
    end
    
  end
end