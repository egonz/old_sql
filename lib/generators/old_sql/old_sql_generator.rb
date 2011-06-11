module OldSql
  class OldSqlGenerator < Rails::Generators::Base
    source_root File.expand_path('../templates', __FILE__)
    namespace "old_sql"

    def print_instructions
      puts "OldSql!

Hello, to install old_sql into your app you need to run:

  rails g old_sql:install

By default Old SQL works with Devise to provide authentication. If you use
Devise, but want use another model than the default 'user' you can provide the
custom model name as an argument:

  rails g old_sql:install member
  
To copy file assets, old_sql.css and the layout for the report view, to your 
installation, execute:

  rails g old_sql:copy_assets

"
    end

  end
end
