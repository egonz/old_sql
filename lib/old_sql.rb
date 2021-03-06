module OldSql
  require 'old_sql/engine' if defined?(Rails)
  
  # The model used by devise. Ensure that the devise columns are installed in the model.
  mattr_accessor :devise_model
  @@devise_model = 'user'
  
  # The title of the Report Selection View.
  mattr_accessor :report_select_page_title
  @@report_select_page_title = 'Old SQL Reports'
  
  # The default report view. This setting will be used unless overridden in 
  # config/old_sql/reports.yml.
  mattr_accessor :default_report_view
  @@default_report_view = 'jqgrid'
  
  # Determines whether the values for the report will be rounded.
  mattr_accessor :round_report_values
  @@round_report_values = true
  
  # The precision to round all values to if rounding is enabled.
  mattr_accessor :rounding_precision
  @@rounding_precision = 2
  
  # Width of the report table or jqGrid.
  mattr_accessor :report_width
  @@report_width = 800
  
  # Height of the report table or jqGrid.
  mattr_accessor :report_height
  @@report_width = 630
  
  # Number of rows to display in the jqGrid component in the jqGrid report view.
  mattr_accessor :jqgrid_row_num
  @@jqgrid_row_num = 25
  
  # Google chart colors.
  mattr_accessor :google_chart_colors
  @@google_chart_colors = ['#E35F18','#307CC7','#D95117','#0A4592','#B33A13','#073D8D','#902811','#052D79','#7A1904','#061E59','#6E0E02','#071253','#530005','#1F3058','#2A437F','#3657A8','#5675BB','#7A94CC','#F38200','#C4794B','#BF5D29','#B8410B','#AD3300','#802205','#36170F']
  
  # Default way to setup Old SQL. Run rails generate old_sql:install to create
  # a fresh initializer with all configuration values.
  def self.setup
    yield self
  end
  
  def self.strip_html html
    text = html.
    gsub(/(&nbsp;|\n|\s)+/im, ' ').squeeze(' ').strip.
    gsub(/<([^\s]+)[^>]*(src|href)=\s*(.?)([^>\s]*)\3[^>]*>\4<\/\1>/i, '\4')

    links = []
    linkregex = /<[^>]*(src|href)=\s*(.?)([^>\s]*)\2[^>]*>\s*/i
    while linkregex.match(text)
      links << $~[3]
      text.sub!(linkregex, "[#{links.size}]")
    end

    text = CGI.unescapeHTML(
      text.
        gsub(/<(script|style)[^>]*>.*<\/\1>/im, '').
        gsub(/<!--.*-->/m, '').
        gsub(/<hr(| [^>]*)>/i, "___\n").
        gsub(/<li(| [^>]*)>/i, "\n* ").
        gsub(/<blockquote(| [^>]*)>/i, '> ').
        gsub(/<(br)(| [^>]*)>/i, "\n").
        gsub(/<(\/h[\d]+|p)(| [^>]*)>/i, "\n\n").
        gsub(/<[^>]*>/, '')
    ).lstrip.gsub(/\n[ ]+/, "\n") + "\n"

    for i in (0...links.size).to_a
      text = text + "\n  [#{i+1}] <#{CGI.unescapeHTML(links[i])}>" unless links[i].nil?
    end
    links = nil
    text
  end
end

require 'extensions/action_controller/base'