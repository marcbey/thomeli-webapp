class AddColumnsForPhoto < ActiveRecord::Migration
  def up
    add_column :assets, :photo_uid, :string
    add_column :assets, :photo_size, :integer

    remove_column :assets, :imagepath
  end

  def down
    add_column :assets, :imagepath, :string

    remove_column :assets, :photo_uid
    remove_column :assets, :photo_size
  end
end


