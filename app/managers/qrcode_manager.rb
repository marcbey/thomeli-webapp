class QrcodeManager
  attr_reader :url, :token, :photo_name, :height, :width

  def initialize( token, photo_name )
    raise ArgumentError, 'Token is missing' if token.blank?
    raise ArgumentError, 'Photo Name is missing' if photo_name.blank?

    base_url = Rails.configuration.downloads_url
    @url = "#{base_url}?token=#{token}"
    @photo_name = photo_name
    @token = token

    @height = 300
    @width = 300
  end

  def self.qrcode_by_token( token )
    raise ArgumentError, 'Token is missing' if token.blank?

    Asset.where( token: token ).first!
  end

  def qrcode_image
    @qrcode_image ||= begin
      qrcode_image = RQRCode::QRCode.new( self.url, :size => 10, :level => :h ).to_img
      qrcode_image.resize( self.height, self.width )
    end
  end

end

