Rails.application.routes.draw do
  scope "report", :module => :old_sql, :as => "old_sql" do
    scope "report", :as => "report" do
      controller "report" do
        match "/", :to => :index, :as => "report_list"
        match "/query", :to => :query, :as => "query"
        match "/datagrid", :to => :datagrid, :as => "datagrid"
        match "/print", :to => :print, :as => "print"
      end
    end
  end
end