class CreateCats < ActiveRecord::Migration[8.1]
  def change
    create_table :cats do |t|
      t.string :name
      t.json :images
      t.integer :age
      t.integer :gender
      t.boolean :stayed_or_neutered
      t.json :tags

      t.timestamps
    end
  end
end
