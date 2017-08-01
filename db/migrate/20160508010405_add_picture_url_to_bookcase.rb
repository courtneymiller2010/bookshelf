class AddPictureUrlToBookcase < ActiveRecord::Migration
  def change
    add_column :bookcases, :picture_url, :text
  end
end
