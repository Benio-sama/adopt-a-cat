class ChangeUserIdNullInCats < ActiveRecord::Migration[8.1]
  def change
    change_column_null :cats, :user_id, true
  end
end
