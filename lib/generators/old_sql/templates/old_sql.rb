# Use this hook to configure the default report view, etc.
OldSql.setup do |config|
  # ==> Default Report View Configuration
  # Configure the default report view. This setting will be used unless overridden 
  # in config/old_sql/reports.yml.
  config.default_report_view = "jqgrid"
end