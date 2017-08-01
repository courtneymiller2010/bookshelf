class CreateMovies < ActiveRecord::Migration
  def change
    create_table :movies do |t|
      t.string :name
      t.text :storyline
      t.integer :bookcase_id

      t.timestamps null: false
    end
  end
end
