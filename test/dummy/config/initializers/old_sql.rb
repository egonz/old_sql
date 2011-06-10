# Use this hook to configure the default report view, etc.
OldSql.setup do |config|
  # ==> Default Report View Configuration
  # The title of the Report Selection View.
  config.report_select_page_title = 'Old SQL Reports'
  
  # Determines whether the values for the report will be rounded.
  config.round_report_values = true
  
  # The precision to round all values to if rounding is enabled.
  config.rounding_precision = 4
  
  # Configure the default report view. This setting will be used unless overridden 
  # in config/old_sql/reports.yml.
  config.default_report_view = "jqgrid"
  
  # ==> jqGrid Report View Configuration
  # Height of the jqGrid component in the jqGrid report view.
  config.jqgrid_height = 630
  
  # Width of the jqGrid component in the jqGrid report view.
  config.jqgrid_width = 800
  
  # Number of rows to display in the jqGrid component in the jqGrid report view.
  config.jqgrid_row_num = 25
end
