class AddColumnsForPhoto < ActiveRecord::Migration
  def up
    add_column :assets, :photo_uid, :string
    add_column :assets, :photo_size, :integer
    add_column :assets, :photo_mime, :string
    add_column :assets, :photo_height, :integer
    add_column :assets, :photo_width, :intger

    remove_column :assets, :imagepath
  end

  def down
    add_column :assets, :imagepath, :string

    remove_column :assets, :photo_uid
    remove_column :assets, :photo_size
    remove_column :assets, :photo_mime
    remove_column :assets, :photo_height
    remove_column :assets, :photo_width
  end
end


