class PhotosController < ApplicationController
  def download
    token = params[:token]
    raise ArgumentError if token.blank?

    qrcode = Qrcode.where( token: token ).first!

    imagename = qrcode.imagename
    photo_url = Rails.root.join( 'photos', imagename )
    photo = File.read( photo_url )

    qrcode.num_photo_downloads += 1
    qrcode.save!

    send_data photo, filename: imagename
  end
end
