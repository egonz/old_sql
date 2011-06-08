module OldSql
  class InstallGenerator < Rails::Generators::Base
    source_root File.expand_path('../templates', __FILE__)
    argument :model_name, :type => :string, :default => 'user'

    desc "Old SQL Install"

    def check_for_devise
      puts "Hello!0
Old SQL works with devise. Checking for a current installation of devise!
"
      if defined?(Devise)
        check_for_devise_models
      else
        puts "Please put gem 'devise' into your Gemfile"
      end

      copy_locales_files
      create_old_sql_dirs
      copy_old_sql_files
      
      puts "Also you need a new migration. We'll generate it for you now."
      invoke 'old_sql:install_migrations'
    end

    private

    def check_for_devise_models
      # File.exists?
      devise_path =  FileUtils.pwd + "/config/initializers/devise.rb"

      if File.exists?(devise_path)
        parse_route_files
      else
        puts "Looks like you don't have devise install! We'll install it for you!"
        invoke 'devise:install'
        set_devise

      end
    end

    def parse_route_files
      # check if migrations exist
      app_path = Rails.public_path.split("/")
      app_path.delete_at(-1)
      app_path = app_path.join("/")
      routes_path = app_path + "/config/routes.rb"

      content = ""

      File.readlines(routes_path).each{|line|
        content += line
      }

      unless content.index("devise_for").nil?
        # there is a devise_for in routes => Do nothing
        puts "Great! You have devise installed and setup!"
      else
        puts "Great you have devise installed, but not set up!"
        set_devise
      end
    end

    def set_devise
      puts "Setting up devise for you!
======================================================"
      invoke 'devise', [model_name]
    end

    def copy_locales_files
      print "Now copying locales files! "
      gem_path = __FILE__
      gem_path = gem_path.split("/")

      gem_path = gem_path[0..-5]
      gem_path = gem_path.join("/")
      ###
      locales_path = gem_path + "/config/locales/*.yml"

      app_path = Rails.public_path.split("/")
      app_path.delete_at(-1)
      app_path = app_path.join("/")

      app_path = app_path + "/config/locales"

      unless File.directory?(app_path)
        FileUtils.mkdir app_path
      end

      Dir.glob(locales_path).each do |file|
        file_path = file.split("/")
        file_path = file_path[-1]
        FileUtils.copy_file(file, app_path + "/" + file_path)
        print "."
      end
      print "\n"

    end
    
    def create_old_sql_dirs
      app_path = Rails.public_path.split("/")
      app_path.delete_at(-1)
      app_path = app_path.join("/")
      
      empty_directory(app_path + "/config/old_sql/")
      empty_directory(app_path + "/config/old_sql/report_sql")
      empty_directory(app_path + "/lib/old_sql/report_processor")
    end
    
    def copy_old_sql_files
      app_path = Rails.public_path.split("/")
      app_path.delete_at(-1)
      app_path = app_path.join("/")
      
      gem_path = __FILE__
      gem_path = gem_path.split("/")
      gem_path = gem_path[0..-5]
      gem_path = gem_path.join("/")
      
      copy_file gem_path + "/config/old_sql/reports.yml.example", app_path + "/config/old_sql/reports.yml"
      copy_file gem_path + "/config/old_sql/report_sql/user.erb.example", app_path + "/config/old_sql/report_sql/user.erb"
      copy_file gem_path + "/lib/old_sql/report_processor/user_processor.rb.example", app_path + "/lib/old_sql/report_processor/user_processor.rb"
    end
  end
end