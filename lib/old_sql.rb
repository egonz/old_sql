module OldSql
  require 'old_sql/engine' if defined?(Rails)
  
  # The default report view. This setting will be used unless overridden in 
  # config/old_sql/reports.yml.
  @@default_report_view = 'jqgrid'
  
  # Default way to setup Old SQL. Run rails generate old_sql:install to create
  # a fresh initializer with all configuration values.
  def self.setup
    yield self
  end
end

require 'extensions/action_controller/base'