class DownloadsController < ApplicationController
  def index
    asset = Asset.where( token: params[:token] ).first!

    disposition = params[:disposition] || 'attachment'

    send_data asset.photo.data, filename: asset.photo_name, disposition: disposition
  end
end

