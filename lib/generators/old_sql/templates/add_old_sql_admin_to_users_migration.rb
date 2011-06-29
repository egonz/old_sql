class AddOldSqlAdminToDeviseModel < ActiveRecord::Migration
  def self.up
    add_column :devise_model, :old_sql_admin, :boolean, :default => false
    
    unless column_exists? :devise_model, :updated_at
      add_column :devise_model, :updated_at, :datetime
    end
    
    unless column_exists? :devise_model, :created_at
      add_column :devise_model, :created_at, :datetime
    end
  end

  def self.down
    remove_column :devise_model, :old_sql_admin
  end
end
