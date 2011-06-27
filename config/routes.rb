Rails.application.routes.draw do
  scope "sql", :module => :old_sql, :as => "old_sql" do
    scope "reports", :as => "reports" do
      controller "report" do
        match "/", :to => :index, :as => "report_list"
        match "/jqgrid", :to => :jqgrid, :as => "jqgrid"
        match "/query", :to => :query, :as => "query"
        match "/table", :to => :table, :as => "table"
        match "/chart", :to => :chart, :as => "chart"
        match "/print", :to => :print, :as => "print"
      end
    end
  end
end