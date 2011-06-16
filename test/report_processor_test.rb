require 'test_helper'
require 'old_sql/report_processor/base'
require 'old_sql/report_design/parser'
require 'old_sql/report_design/model'
require 'old_sql/report_design/row'
require 'old_sql/report_design/cell'
require 'old_sql/report_design/cell_data'
require 'old_sql/report_design/chart_parser'
require 'old_sql/report_design/chart'
require 'old_sql/report_design/chart_item'
require 'old_sql/report_design/chart_data'

class ReportProcessorTest < ActiveSupport::TestCase
  test "loading sub processor" do
    template = File.read("#{OldSql::ReportDesign::Parser.report_design_path}/../reports.yml")
    report = YAML.load(Erubis::Eruby.new(template).result)['user_table_alt_db']
    
    puts "loading #{report['report_processor']}" 
    
    base_parser = OldSql::ReportProcessor::Base.new
    data = base_parser.execute_query(report,'2011-05-06','2011-08-06')
    puts "SUB PROCESSOR DATA #{data}"
    
    #todo add assertions
  end
  
  test "processing chart design" do
    template = File.read("#{OldSql::ReportDesign::Parser.report_design_path}/../reports.yml")
    report = YAML.load(Erubis::Eruby.new(template).result)['user_chart'] 
    
    base_parser = OldSql::ReportProcessor::Base.new
    data = base_parser.execute_query(report,'2011-05-06','2011-08-06')
    puts "CHART DATA #{data}"
    
    puts "CHART DATA JSON #{data.values.first.to_json}"
    
    #todo add assertions
  end
end