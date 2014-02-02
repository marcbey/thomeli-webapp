class QrcodesController < ApplicationController
  def generate
    photo_name = params[:photo_name]

    token_manager = TokenManager.new
    qrcode_manager = QrcodeManager.new( token_manager, photo_name )
    photo_manager = PhotoManager.new( photo_name )
    asset_manager = AssetManager.new( qrcode_manager, photo_manager, photo_name )
    asset_manager.save!

    if params[:embed_url].present?
      data = asset_manager.asset.qrcode.embed_url( asset_manager.asset, qrcode_manager.url ).data
    else
      data = asset_manager.asset.qrcode.data
    end

    send_data( data, filename: Asset::QRCODE_IMAGE_NAME, type: 'image/png', disposition: 'inline' )
  end
end
