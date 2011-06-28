module OldSql
  class InstallGenerator < Rails::Generators::Base
    source_root File.expand_path('../templates', __FILE__)
    argument :model_name, :type => :string, :default => 'user'

    desc "Old SQL Install"

    def check_for_devise
      puts "Old SQL works with devise. Checking for a current installation of devise!\n"

      if defined?(Devise)
        check_for_devise_models
      else
        puts "Please put gem 'devise' into your Gemfile"
      end
      
      puts "Also you need a new migration. We'll generate it for you now."
      invoke 'old_sql:install_migrations'
    end
    
    def copy_initializer
      template "old_sql.rb", "config/initializers/old_sql.rb"
    end
    
    def copy_locales_files
      print "Now copying locales files! "
      ###
      locales_path = "#{gem_path}/config/locales/*.yml"

      locales_app_path = "#{app_path}/config/locales"

      unless File.directory?(locales_app_path)
        FileUtils.mkdir locales_app_path
      end

      Dir.glob(locales_path).each do |file|
        file_path = file.split("/")
        file_path = file_path[-1]
        FileUtils.copy_file(file, "#{locales_app_path}/#{file_path}")
        print "."
      end
      print "\n"

    end
    
    def create_old_sql_dirs
      empty_directory "#{app_path}/config/old_sql/"
      empty_directory "#{app_path}/config/old_sql/report_sql"
      empty_directory "#{app_path}/config/old_sql/report_design"
      empty_directory "#{app_path}/lib/old_sql/report_processor"
      empty_directory "#{app_path}/lib/old_sql/db"
    end
    
    def copy_old_sql_files
      path_to_reports_config = "#{app_path}/config/old_sql/reports.yml"
      copy_file "reports.yml.example", path_to_reports_config unless File.exists?(path_to_reports_config)
      copy_file "user.erb.example", "#{app_path}/config/old_sql/report_sql/user_old_sql_demo.erb"
      copy_file "user_processor.rb.example", "#{app_path}/lib/old_sql/report_processor/user_old_sql_demo_processor.rb"
      copy_file "user_design_template.csv", "#{app_path}/config/old_sql/report_design/user_old_sql_demo.csv"
      copy_file "user_old_sql_demo_chart_design.yml", "#{app_path}/config/old_sql/report_design/user_old_sql_demo.yml"
      copy_file "test_db.rb", "#{app_path}/lib/old_sql/db/test.rb"
    end
    
    def configure_initializer
      initializer_path = "#{app_path}/config/initializers/old_sql.rb"
      gsub_file initializer_path, /DeviseModel/, "#{model_name.downcase}"
    end
    
    ################ PRIVATE ################

    private

    def check_for_devise_models
      # File.exists?
      devise_path =  "#{FileUtils.pwd}/config/initializers/devise.rb"

      if File.exists?(devise_path)
        parse_route_files
      else
        puts "Looks like you don't have devise install! We'll install it for you!"
        
        invoke 'devise:install'
        
        if !devise_table_exists?
          puts 'User Model Does Not Exist'
          set_devise
        elsif !model_has_devise?
          puts 'User Model Does Not Have Devise Support'
          invoke 'old_sql:install_devise_migrations'
          create_model_class unless model_exists?
          add_devise_to_routes
        end

      end
    end
    
    def devise_table_exists?
      app_path = Rails.public_path.split("/")
      app_path.delete_at(-1)
      app_path = app_path.join("/")
      schema_path = "#{app_path}/db/schema.rb"
      
      puts "Checking #{schema_path} for pattern #{model_name}" 
      
      if File.exists?(schema_path) && open(schema_path).grep(/#{model_name.pluralize}/).count>0
        return true
      else
        return false
      end
    end
    
    def model_has_devise?
      app_path = Rails.public_path.split("/")
      app_path.delete_at(-1)
      app_path = app_path.join("/")
      schema_path = app_path+'/db/schema.rb'

      puts "Checking #{schema_path} for pattern /database_authenticatable/"

      if File.exists?(schema_path) && open(schema_path).grep(/database_authenticatable/).count>0
        return true
      else
        return false
      end
    end
    
    def model_exists?
      app_path = Rails.public_path.split("/")
      app_path.delete_at(-1)
      app_path = app_path.join("/")
      
      File.exists?("#{app_path}/app/models/#{model_name}.rb")
    end
    
    def create_model_class
      model_path = "#{app_path}/app/models/#{model_name}.rb"
      copy_file "devise_model.rb.template", model_path
      gsub_file model_path, /DeviseModel/, "#{model_name.capitalize}"
    end
    
    def add_devise_to_routes
      routes_path = "#{app_path}/config/routes.rb"
      if open(routes_path).grep(/devise_for :#{model_name}/).count<=0
        puts "Adding devise_for :#{model_name} to #{routes_path}"
        insert_into_file routes_path, "  devise_for :#{model_name}\n\n", :after => "Application.routes.draw do\n"
      end
    end

    def parse_route_files
      # check if migrations exist
      routes_path = "#{app_path}/config/routes.rb"

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
    
    def app_path
      app_path = Rails.public_path.split("/")
      app_path.delete_at(-1)
      app_path = app_path.join("/")
      app_path
    end
    
    def gem_path
      gem_path = __FILE__
      gem_path = gem_path.split("/")
      gem_path = gem_path[0..-5]
      gem_path = gem_path.join("/")
      gem_path
    end
  end
end