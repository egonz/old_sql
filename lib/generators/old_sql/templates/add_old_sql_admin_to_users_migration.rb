class AddOldSqlAdminToDeviseModel < ActiveRecord::Migration
  def self.up
    add_column :devise_model, :old_sql_admin, :boolean, :default => false
  end

  def self.down
    remove_column :devise_model, :old_sql_admin
  end
end
