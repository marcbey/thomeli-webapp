class QrcodesController < ApplicationController
  def image
    photo_name = params[:photo_name]
    raise ArgumentError, 'photo_name is missing!' if photo_name.blank?

    token_manager = TokenManager.new

    dimensions = params[:dimensions]
    qrcode_manager = QrcodeManager.new( token_manager, photo_name, dimensions )

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

  def url
    photo_name = params[:photo_name]
    asset = Asset.where( photo_name: photo_name ).first!

    render text: asset.url
  end
end

