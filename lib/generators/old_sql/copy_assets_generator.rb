module OldSql
  class CopyAssetsGenerator < Rails::Generators::Base
    source_root File.expand_path('../templates', __FILE__)
    
    desc "Old SQL Copy Assets"
    
    def copy_assets
      
    end
    
    def create_old_sql_dirs
      empty_directory "#{app_path}/public/stylesheets/old_sql"
      empty_directory "#{app_path}/app/views/layouts/old_sql"
    end
    
    def copy_old_sql_files
      copy_file "#{gem_path}/public/stylesheets/old_sql/old_sql.css", "#{app_path}/public/stylesheets/old_sql/old_sql.css"
      copy_file "#{gem_path}/app/views/layouts/old_sql/report.html.erb", "#{app_path}/app/views/layouts/old_sql/report.html.erb"
    end
    
    private
    
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