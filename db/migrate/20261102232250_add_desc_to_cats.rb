class AddDescToCats < ActiveRecord::Migration[8.1]
  def change
    add_column :cats, :desc, :json
  end
end
