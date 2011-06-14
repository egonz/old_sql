module OldSql
  module ReportDesign
    class ChartParser
      def self.read_file file_to_read
        raise ArgumentError, 'Argument file is null.' unless !file_to_read.nil?
        full_path = "#{report_design_path}/#{file_to_read}"
        raise ArgumentError, "File #{full_path} not found." unless File.exists?(full_path)
        
        @chart = Chart.new
        
        template = File.read("#{report_design_path}/#{file_to_read}")
        design_template = YAML.load(Erubis::Eruby.new(template).result)
        
        design_template.each do |type, i|
          @chart.type = type
          i.each do |key, value|
            @chart.add(key, value)
          end
        end
      
        @chart
      end
      
      def self.report_design_path
        app_path = Rails.public_path.split("/")
        app_path.delete_at(-1)
        app_path = app_path.join("/")
        app_path << "/config/old_sql/report_design"
      end
    end
  end
end