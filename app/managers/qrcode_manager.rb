class QrcodeManager
  attr_reader :qrcode, :url, :token, :photo_name

  def initialize( token, photo_name )
    raise ArgumentError, 'Token is missing' if token.blank?
    raise ArgumentError, 'Photo Name is missing' if photo_name.blank?

    base_url = Rails.configuration.request_photo_url
    @url = "#{base_url}?token=#{token}"
    @photo_name = photo_name
    @token = token
  end

  def qrcode_image
    @qrcode_image ||= begin
      qrcode_image = RQRCode::QRCode.new( self.url, :size => 10, :level => :h ).to_img
      qrcode_image.resize( 300, 300 )
    end
  end

  def initialize_qrcode
    qrcode = Qrcode.where( photo_name: self.photo_name ).first_or_initialize

    qrcode.url = self.url
    qrcode.token = self.token
    qrcode.num_qrcodes_downloads += 1
    qrcode.qrcode = self.qrcode_image.to_string
    qrcode.save!

    return qrcode
  end
end
