class CreateBookcases < ActiveRecord::Migration
  def change
    create_table :bookcases do |t|
      t.string :name
      t.text :description
      t.integer :shelves_count

      t.timestamps null: false
    end
  end
end
