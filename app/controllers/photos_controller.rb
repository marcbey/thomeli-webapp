class PhotosController < ApplicationController
  def download
    photo_manager = PhotoManager.photo_with_token( params[:token] )

    disposition = params[:disposition] || 'attachment'

    send_data photo_manager.photo, filename: photo_manager.photo_name, disposition: disposition
  end
end
