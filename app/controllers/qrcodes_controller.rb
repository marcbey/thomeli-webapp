require 'digest/sha1'

class QrcodesController < ApplicationController
  def generate
    imagename = params[:imagename]
    raise ArgumentError if imagename.blank?

    secret = Rails.configuration.photo_secret
    sha1 = Digest::SHA1.hexdigest( "#{imagename}+#{secret}" )

    base_url = Rails.configuration.request_photo_url
    url = "#{base_url}?secret=#{sha1}"

    qrcode_img = RQRCode::QRCode.new( url, :size => 10, :level => :h ).to_img
    qrcode_img = qrcode_img.resize( 300, 300 )

    qrcode = Qrcode.where( imagename:imagename ).first_or_initialize
    qrcode.url = url
    qrcode.num_qrcodes_downloads += 1
    qrcode.qrcode = qrcode_img.to_string
    qrcode.save!

    send_data qrcode_img, filename: "qrcode.png"
  end
end

