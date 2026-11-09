class AddSaltToUsers2 < ActiveRecord::Migration[8.1]
  def change
    add_column :users, :salt, :string
    rename_column :users, :password, :encrypted_password
  end
end
