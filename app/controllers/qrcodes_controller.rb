class QrcodesController < ApplicationController
  def generate
    photo_name = params[:photo_name]

    qrcode_manager = QrcodeManager.new( TokenManager, photo_name )
    photo_manager = PhotoManager.new( photo_name )
    asset_manager = AssetManager.new( qrcode_manager, photo_manager, photo_name )
    asset_manager.save!

    send_data qrcode_manager.qrcode_image,
              filename: Asset::QRCODE_IMAGE_NAME,
              type: 'image/png', 
              disposition: 'inline'
  end
end
