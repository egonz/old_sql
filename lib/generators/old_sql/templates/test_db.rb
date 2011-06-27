require 'active_record'

module OldSql
  module Db
    class Test < ActiveRecord::Base
      config = YAML.load_file(File.join("#{File.dirname(__FILE__)}/../../../config/", 'database.yml'))
      
      establish_connection config['test']
    end
  end
end
