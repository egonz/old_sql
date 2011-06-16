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

class ReportDesignParserTest < ActiveSupport::TestCase
  test "parsing design document" do
    # TEST REQUIRED PARAMETERS (I might remove these)
    assert_raise(ArgumentError) {OldSql::ReportDesign::Parser.read_file}
    assert_raise(ArgumentError) {OldSql::ReportDesign::Parser.read_file "foo.csv"}
    
    model = OldSql::ReportDesign::Parser.read_file "user_old_sql_demo.csv"
    
    # TEST STRUCTURE
    assert_instance_of OldSql::ReportDesign::Model, model
    assert_instance_of OldSql::ReportDesign::Row, model.rows[0]
    assert_instance_of OldSql::ReportDesign::Cell, model.rows[0].cells[0]
    assert_instance_of OldSql::ReportDesign::CellData, model.rows[0].cells[0].cell_data[0]
    
    # TEST CELL_DATA
    assert_equal model.rows[0].cells[0].cell_data[0].type, OldSql::ReportDesign::CellData::COLUMN
    assert_equal model.rows[1].cells[0].cell_data[0].type, OldSql::ReportDesign::CellData::LABEL
    assert_equal model.rows[1].cells[1].cell_data[0].type, OldSql::ReportDesign::CellData::COLUMN
    assert_equal model.rows[1].cells[1].cell_data[1].type, OldSql::ReportDesign::CellData::OPERATOR
    assert_equal model.rows[1].cells[1].cell_data[2].type, OldSql::ReportDesign::CellData::COLUMN
    
    assert_equal model.row(1).cell(1).cell_data[2].data, "id"
    
    assert_equal :"#{model.rows[0].cells[0].cell_data[0].data}", :id
    
    assert_equal model.rows[1].cells[0].expression?, false
    assert_equal model.rows[1].cells[1].expression?, true
  end
  
  test "using design document" do
    model = OldSql::ReportDesign::Parser.read_file "user_old_sql_demo.csv"
    
    template = File.read("#{OldSql::ReportDesign::Parser.report_design_path}/../reports.yml")
    report = YAML.load(Erubis::Eruby.new(template).result)['user_table']
    
    base_parser = OldSql::ReportProcessor::Base.new
    data = base_parser.execute_query(report,'2011-05-06','2011-08-06',nil)
    puts "DATA #{data}"
    
    #todo add assertion
  end
end
