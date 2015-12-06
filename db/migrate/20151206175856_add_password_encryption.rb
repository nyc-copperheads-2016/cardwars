class AddPasswordEncryption < ActiveRecord::Migration
  def change
    add_column :username, :password_hash
    remove_column :users, :password
  end
end



