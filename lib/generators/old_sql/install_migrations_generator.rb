require 'rails/generators'
require 'rails/generators/migration'

module OldSql
  class InstallMigrationsGenerator < Rails::Generators::Base
    include Rails::Generators::Migration
    source_root File.expand_path('../templates', __FILE__)
    argument :model_name, :type => :string, :default => 'user'

    def self.next_migration_number(dirname)
      if ActiveRecord::Base.timestamped_migrations
        @migration_number = Time.now.utc.strftime("%Y%m%d%H%M%S").to_i
        @migration_number += 1
        @migration_number.to_s
      else
        @migration_number = "%.3d" % (current_migration_number(dirname) + 1)
      end
    end

    def create_migration_file
      sleep 1 # ensure scripts have different timestamps
      migration_template 'add_old_sql_admin_to_users_migration.rb', "db/migrate/add_old_sql_admin_to_#{model_name.pluralize}.rb" rescue p $!.message
      gsub_file "db/migrate/#{@migration_number}_add_old_sql_admin_to_#{model_name.pluralize}.rb", /devise_model/, "#{model_name.pluralize}"
      gsub_file "db/migrate/#{@migration_number}_add_old_sql_admin_to_#{model_name.pluralize}.rb", /DeviseModel/, "#{model_name.pluralize.capitalize}"
      #sleep 1 # ensure scripts have different timestamps
    end
  end
end
