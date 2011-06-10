require 'test_helper'
require 'old_sql/report_processor/base'

class ReportDesignParserTest < ActiveSupport::TestCase
  test "loading sub processor" do
    model = OldSql::ReportDesign::Parser.read_file "user.csv"
    
    template = File.read("#{OldSql::ReportDesign::Parser.report_design_path}/../reports.yml")
    report = YAML.load(Erubis::Eruby.new(template).result)['user']
    
    puts "loading #{report['report_processor']}" 
    
    base_parser = OldSql::ReportProcessor::Base.new
    data = base_parser.execute_query(report['report_sql'],'2011-05-06','2011-08-06',nil,nil,report['report_processor'])
    puts "SUB PROCESSOR DATA #{data}"
    
    #todo add assertions
  end
end