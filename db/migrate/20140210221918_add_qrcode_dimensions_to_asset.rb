class AddQrcodeDimensionsToAsset < ActiveRecord::Migration
  def up
    add_column :assets, :qrcode_dimensions, :string
  end

  def down
    remove_column :assets, :qrcode_dimensions, :string
  end
end
