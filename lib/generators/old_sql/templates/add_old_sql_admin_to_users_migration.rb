class AddOldSqlAdminToDeviseModel < ActiveRecord::Migration
  def self.up
    add_column :users, :old_sql_admin, :boolean, :default => false
  end

  def self.down
    remove_column :users, :old_sql_admin
  end
end
