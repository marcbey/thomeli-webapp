class DownloadsController < ApplicationController
  def index
    disposition = params[:disposition] || 'attachment'

    self.asset.increment_num_photo_downloads!

    send_data self.asset.photo.data, filename: self.asset.photo_name, disposition: disposition
  end
end

