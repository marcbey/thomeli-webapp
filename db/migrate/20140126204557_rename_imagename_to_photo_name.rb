class RenameImagenameToPhotoName < ActiveRecord::Migration
  def up
    rename_column :qrcodes, :imagename, :photo_name
  end

  def down
    rename_column :qrcodes, :photo_name, :imagename
  end
end
