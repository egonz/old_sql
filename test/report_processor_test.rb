require 'test_helper'
require 'old_sql/report_processor/base'

class ReportProcessorTest < ActiveSupport::TestCase
  test "loading sub processor" do
    template = File.read("#{OldSql::ReportDesign::Parser.report_design_path}/../reports.yml")
    report = YAML.load(Erubis::Eruby.new(template).result)['user_table']
    
    puts "loading #{report['report_processor']}" 
    
    base_parser = OldSql::ReportProcessor::Base.new
    data = base_parser.execute_query(report['report_sql'],'2011-05-06','2011-08-06',nil,nil,report['report_processor'])
    puts "SUB PROCESSOR DATA #{data}"
    
    #todo add assertions
  end
  
  test "processing chart design" do
    template = File.read("#{OldSql::ReportDesign::Parser.report_design_path}/../reports.yml")
    report = YAML.load(Erubis::Eruby.new(template).result)['user_chart'] 
    
    base_parser = OldSql::ReportProcessor::Base.new
    data = base_parser.execute_query(report['report_sql'],'2011-05-06','2011-08-06',nil,report['report_design'])
    puts "CHART DATA #{data}"
    
    puts "CHART DATA JSON #{data.values.first.to_json}"
    
    #todo add assertions
  end
end