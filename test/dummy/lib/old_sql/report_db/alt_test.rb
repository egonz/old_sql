require 'active_record'

module OldSql
  module ReportDb
    class AltTest < ActiveRecord::Base
      config = YAML.load_file(File.join("#{File.dirname(__FILE__)}/../../../config/", 'database.yml'))
      
      establish_connection config['development']
    end
  end
end
