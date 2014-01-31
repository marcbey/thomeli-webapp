class Asset; end
class Qrcode; end

class RenameTableQrcode < ActiveRecord::Migration
  def up
    rename_table :qrcodes, :assets
  end

  def down
    rename_table :assets, :qrcodes
  end
end

