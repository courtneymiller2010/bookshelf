class AddFieldsToMovie < ActiveRecord::Migration
  def change
    add_column :movies, :rated, :string
    add_column :movies, :released, :date
    add_column :movies, :runtime, :string
    add_column :movies, :genre, :string
    add_column :movies, :director, :string
    add_column :movies, :writer, :string
    add_column :movies, :language, :string
    add_column :movies, :country, :string
  end
end
