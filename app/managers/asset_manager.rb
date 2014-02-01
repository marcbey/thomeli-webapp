class AssetManager
  attr_reader :qrcode_image, :photo_image, :photo_name, :token, :url

  def initialize( qrcode_image, photo_image, photo_name, token, url )
    @qrcode_image = qrcode_image
    @photo_image = photo_image
    @photo_name = photo_name
    @token = token
    @url = url
  end

  def save!
    asset = Asset.where( photo_name: self.photo_name ).first_or_initialize

    if asset.new_record?
      asset.qrcode = self.qrcode_image.to_s
      asset.qrcode.name = Asset::QRCODE_IMAGE_NAME
      asset.photo = self.photo_image
      asset.photo.name = self.photo_name
      asset.token = self.token
      asset.url = self.url
    else
      asset.num_qrcodes_downloads += 1
    end

    asset.save!
  end
end
