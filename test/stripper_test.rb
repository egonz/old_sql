require 'test_helper'
require 'old_sql/stripper'

class OldSqlTest < ActiveSupport::TestCase
  test "strip html" do
    puts OldSql::Stripper.strip_html("<h1>Title</h1> This is the body. Testing <a href='http://www.google.com/'>link to Google</a>.<p /> Testing image <img src='/noimage.png'>.<br /> The End.")
    puts OldSql::Stripper.strip_html("This is a <br />Title").gsub("\n","")
  end
end