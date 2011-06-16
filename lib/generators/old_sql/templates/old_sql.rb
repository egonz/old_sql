# Use this hook to configure the default report view, etc.
OldSql.setup do |config|
  # The model used by devise. Ensure that the devise columns are installed in the model.
  config.devise_model = 'DeviseModel'
  
  # ==> Default Report View Configuration
  # The title of the Report Selection View.
  config.report_select_page_title = 'Old SQL Reports'
  
  # Determines whether the values for the report will be rounded.
  config.round_report_values = true
  
  # The precision to round all values to if rounding is enabled.
  config.rounding_precision = 2
  
  # Configure the default report view. This setting will be used unless overridden 
  # in config/old_sql/reports.yml.
  config.default_report_view = "jqgrid"
  
  # Height of the report table or jqGrid.
  config.report_height = 630
  
  # Width of the report table or jqGrid.
  config.report_width = 800
  
  # ==> jqGrid Report View Configuration
  # Number of rows to display in the jqGrid component in the jqGrid report view.
  config.jqgrid_row_num = 25
  
  # ==> Google Chart View Configuration
  # Google chart colors.
  config.google_chart_colors = ['#E35F18','#307CC7','#D95117','#0A4592','#B33A13','#073D8D','#902811','#052D79','#7A1904','#061E59','#6E0E02','#071253','#530005','#1F3058','#2A437F','#3657A8','#5675BB','#7A94CC','#F38200','#C4794B','#BF5D29','#B8410B','#AD3300','#802205','#36170F']
end