require "old_sql"
require "rails"
require "action_controller"

module OldSql
  class Engine < Rails::Engine
    engine_name :old_sql
  end
end