class DownloadsController < ApplicationController
  before_filter :set_asset

  def index
    disposition = params[:disposition] || 'attachment'

    @asset.increment_num_photo_downloads!

    send_data @asset.photo.data, filename: @asset.photo_name, disposition: disposition
  end
end

