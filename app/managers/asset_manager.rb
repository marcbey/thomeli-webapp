class AssetManager
  def initialize
  end
  def initialize_qrcode
    asset = Asset.where( photo_name: self.photo_name ).first_or_initialize

    # asset.photo_image = self.photo_image
    asset.qrcode_image = self.qrcode_image

    asset.code = self.token
    asset.url = self.url
    asset.num_qrcodes_downloads += 1

    asset.save!
  end
  
end
