class QrcodesController < ApplicationController
  def generate
    photo_name = params[:photo_name]

    qrcode_manager = QrcodeManager.new( TokenManager, photo_name )
    token = qrcode_manager.token

    photo_manager = PhotoManager.new( photo_name )
    asset_manager = AssetManager.new( qrcode_manager.qrcode_image, 
                                      photo_manager.photo_image, 
                                      photo_name, token,
                                      qrcode_manager.url )
    asset_manager.save!

    send_data qrcode_manager.qrcode_image,
              filename: 'qrcode.png',
              type: 'image/png', 
              disposition: 'inline'
  end
end
