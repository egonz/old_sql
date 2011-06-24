require 'cgi'

module OldSql
  class ShellReportFacade
    def self.run_report(report, env, start_date, end_date, clean)
    template = File.read("#{OldSql::ReportDesign::Parser.report_design_path}/../reports.yml")
    report_config = YAML.load(Erubis::Eruby.new(template).result)[report] 
    
    Rails.env = env
    set_logger
    set_connection(env)
    
    base_parser = OldSql::ReportProcessor::Base.new
    data = base_parser.execute_query(report_config,start_date,end_date,nil)
                                     
    print_header(report, start_date, end_date, clean)
    print_data(data, report_config['fields'], clean)
    print_footer(clean)
  end
  
  private
  
  def self.print_header(report, start_date, end_date, clean)
    puts "#######################################################################" unless clean
    puts "#{report.upcase} REPORT START_DATE:#{start_date} END_DATE:#{end_date}" unless clean
  end
  
  def self.print_data(data, fields, clean)
    puts "-----------------------------------------------------------------------" unless clean
    
    print_fields(fields, clean)
    
    if data.nil?
      puts "NO DATA"
      return
    end
    
    data[:rows].each do |row|
      line = ""
      first = true
      row[:cell].each do |cell|
        line << ", " if !first
        line << OldSql.strip_html(cell.to_s).gsub("\n","")
        first = false
      end
      puts line
    end
  end
  
  def self.print_fields(fields, clean)
    first = true
    fields.each do |f|
      print ", " if !first
      print "#{f.upcase}"
      first = false
    end
    print "\n\n"
  end
  
  def self.print_footer(clean)
    puts "-----------------------------------------------------------------------" unless clean
    puts "COMPLETED AT:#{Time.now}" unless clean
    puts "#######################################################################" unless clean
  end
  
  def self.set_logger
    if defined?(Rails)
      Rails.logger = Logger.new(STDOUT)
    end
  end
  
  def self.set_connection(env)
    dbconfig = YAML::load(Erubis::Eruby.new(File.read(Rails.root.join("config/database.yml"))).result)
    ActiveRecord::Base.establish_connection(dbconfig[env])
  end
  end
end