class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.string :title
      t.text :comment
      t.references :commentable, polymorphic: true

      t.timestamps null: false
    end

    add_index :comments, :commentable_type
    add_index :comments, :commentable_id
  end
end
