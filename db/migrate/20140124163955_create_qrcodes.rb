class CreateQrcodes < ActiveRecord::Migration
  def change
    create_table :qrcodes do |t|
      t.string :imagename
      t.string :imagepath
      t.string :url
      t.string :qrcode_uid
      t.string :qrcode_name

      t.timestamps
    end
  end
end

