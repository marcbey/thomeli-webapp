class QrcodesController < ApplicationController
  def generate
    photo_name = params[:photo_name]

    token_manager = TokenManager.new( photo_name )
    qrcode_manager = QrcodeManager.new( token_manager.token, photo_name )
    qrcode_manager.initialize_qrcode

    send_data qrcode_manager.qrcode_image,
              filename: 'qrcode.png',
              type: 'image/png', 
              disposition: 'inline'
  end
end
