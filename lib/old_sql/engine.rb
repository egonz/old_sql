require "old_sql"
require "rails"
require "action_controller"

module OldSql
  class Engine < Rails::Engine
    initializer "static assets" do |app|
      app.middleware.use ::ActionDispatch::Static, "#{root}/public"
    end
    
    rake_tasks do
      Dir[File.join(File.dirname(__FILE__),'tasks/*.rake')].each { |f| load f }
      #load "rails_admin/railties/tasks.rake"
    end
  end
end