class CreateBooks < ActiveRecord::Migration
  def change
    create_table :books do |t|
      t.string :name
      t.string :isbn
      t.date :published
      t.integer :pages_count
      t.integer :bookcase_id

      t.timestamps null: false
    end
  end
end
