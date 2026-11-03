class RenameStayedOrNeutered < ActiveRecord::Migration[8.1]
  def change
    rename_column :cats, :stayed_or_neutered, :spayed_or_neutered
  end
end
