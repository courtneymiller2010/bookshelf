class CreateActors < ActiveRecord::Migration
  def change
    create_table :actors do |t|
      t.string :name
      t.date :birth_date
      t.string :birthplace

      t.timestamps null: false
    end
  end
end
