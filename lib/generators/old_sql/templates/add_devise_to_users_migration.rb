class AddDeviseToDeviseModel < ActiveRecord::Migration
  def self.up
    null    = false
    default = ""

    add_column :device_model, :encrypted_password, :string, :null => null, :default => default, :limit => 128
    add_column :device_model, :password_salt, :string
    add_column :device_model, :authentication_token, :string
    add_column :device_model, :confirmation_token,   :string
    add_column :device_model, :confirmed_at,         :datetime
    add_column :device_model, :confirmation_sent_at, :datetime
    add_column :device_model, :reset_password_token, :string
    add_column :device_model, :remember_token,      :string
    add_column :device_model, :remember_created_at, :datetime
    add_column :device_model, :sign_in_count,      :integer, :default => 0
    add_column :device_model, :current_sign_in_at, :datetime
    add_column :device_model, :last_sign_in_at,    :datetime
    add_column :device_model, :current_sign_in_ip, :string
    add_column :device_model, :last_sign_in_ip,    :string

    #:lockable fields contributed by MattSlay
    add_column :device_model, :failed_attempts, :integer, :default => 0
    add_column :device_model, :unlock_token,   :string
    add_column :device_model, :locked_at, :datetime

  end

  def self.down
    remove_column :device_model, :encrypted_password
    remove_column :device_model, :password_salt
    remove_column :device_model, :authentication_token
    remove_column :device_model, :confirmation_token
    remove_column :device_model, :confirmed_at
    remove_column :device_model, :confirmation_sent_at
    remove_column :device_model, :reset_password_token
    remove_column :device_model, :remember_token
    remove_column :device_model, :remember_created_at
    remove_column :device_model, :sign_in_count
    remove_column :device_model, :current_sign_in_at
    remove_column :device_model, :last_sign_in_at
    remove_column :device_model, :current_sign_in_ip
    remove_column :device_model, :last_sign_in_ip
    remove_column :device_model, :failed_attempts
    remove_column :device_model, :unlock_token
    remove_column :device_model, :locked_at
  end
end