class AddColumnToQrcodes < ActiveRecord::Migration
  def change
    add_column :qrcodes, :num_qrcodes_downloads, :integer, default: 0

    add_column :qrcodes, :num_photo_downloads, :integer, default: 0

    add_column :qrcodes, :photo_available, :boolean, default: false

  end
end
