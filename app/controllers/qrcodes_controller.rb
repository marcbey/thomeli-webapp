class QrcodesController < ApplicationController
  def generate
    photo_name = params[:photo_name]

    token_manager = TokenManager.new
    qrcode_manager = QrcodeManager.new( token_manager.token, photo_name )
    # photo_manager = PhotoManager.new( photo_name )
    # asset_manager = AssetManager.new( qrcode_manager.qrcode_image, photo_manager.photo_image, photo_name )
    # asset_manager.save!

    send_data qrcode_manager.qrcode_image,
              filename: 'qrcode.png',
              type: 'image/png', 
              disposition: 'inline'
  end
end
