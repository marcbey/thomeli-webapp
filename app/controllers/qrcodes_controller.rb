class QrcodesController < ApplicationController
  def generate
    imagename = params[:imagename]

    url = 'http://digitalocean-thomeli.de/image?secret=123'
    qrcode_img = RQRCode::QRCode.new( url, :size => 10, :level => :h ).to_img
    qrcode_img = qrcode_img.resize( 300, 300 )

    qrcode = Qrcode.create!( url: url, imagename: imagename, 
                             qrcode: qrcode_img.to_string )

    send_data qrcode_img, filename: imagename
  end
end

