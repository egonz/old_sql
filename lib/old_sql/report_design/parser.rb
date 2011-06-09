module OldSql
  module ReportDesign
    class Parser
      def self.read_file file_to_read
        raise ArgumentError, 'Argument file is null.' unless !file_to_read.nil?
        full_path = "#{report_design_path}/#{file_to_read}"
        raise ArgumentError, "File #{full_path} not found." unless File.exists?(full_path)
        
        @model = Model.new
        
        file = File.new(full_path, "r")
        while (line = file.gets)
          @model.add line
        end
        file.close
      
        @model
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