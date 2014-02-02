class DownloadsController < ApplicationController
  def index
    asset = Asset.where( token: params[:token] ).first!

    disposition = params[:disposition] || 'attachment'

    asset.increment_num_photo_downloads!

    send_data asset.photo.data, filename: asset.photo_name, disposition: disposition
  end
end

