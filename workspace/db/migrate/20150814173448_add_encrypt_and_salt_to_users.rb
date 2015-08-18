class AddEncryptAndSaltToUsers < ActiveRecord::Migration
  def change
    add_column :admins, :encrypted_password, :string
    add_column :admins, :salt, :string
  end
end
