class AssetManager
  attr_reader :qrcode_manager, :photo_manager, :photo_name, :asset

  def initialize( qrcode_manager, photo_manager, photo_name )
    @qrcode_manager = qrcode_manager
    @photo_manager = photo_manager
    @photo_name = photo_name
  end

  def save!
    @asset = Asset.where( photo_name: self.photo_name ).first_or_initialize

    if @asset.new_record?
      @asset.qrcode = self.qrcode_manager.qrcode_image.to_s
      @asset.qrcode.name = Asset::QRCODE_IMAGE_NAME
      @asset.token = self.qrcode_manager.token
      @asset.url = self.qrcode_manager.url
    end

    if self.photo_manager.photo_image_exists?
      @asset.photo = self.photo_manager.photo_image
      @asset.photo.name = self.photo_name
    end

    @asset.save!

    #self.photo_manager.remove_photo_from_drop_folder
  end
end

