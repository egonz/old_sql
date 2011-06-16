require 'test_helper'

class ReportDbTest < ActiveSupport::TestCase
  test "loading secondary db connection" do
    report_db = "old_sql/report_db/alt_test"
    
    require report_db
    
    db_class_name = ""
    first = true
    
    report_db.split("/").each do |path|
      db_class_name << "::" unless first
      path.split("_").each {|c| db_class_name << c.capitalize }
      first = false
    end
          
    puts "CLASS NAME #{db_class_name}"
    
    db=eval(db_class_name).connection
    
    assert db.active?
  end
end
          