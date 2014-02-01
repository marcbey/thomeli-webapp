class QrcodeManager
  attr_reader :token_manager, :photo_name, :url, :height, :width

  def initialize( token_manager, photo_name )
    @token_manager = token_manager
    @photo_name = photo_name

    @url = "#{Rails.configuration.token_url}/#{token}"
    @height = 300
    @width = 300
  end

  def self.qrcode_by_token( token )
    raise ArgumentError, 'Token is missing' if token.blank?

    Asset.where( token: token ).first!
  end

  def token
    @token ||= begin
      if asset = Asset.where( photo_name: photo_name ).first
        @qrcode_image = asset.qrcode.data
        @token = asset.token
      else
        @token = token_manager.new.token
      end
    end
  end

  def qrcode_image
    @qrcode_image ||= begin
      qrcode_image = RQRCode::QRCode.new( self.url, :size => 10, :level => :h ).to_img
      qrcode_image.resize( self.height, self.width )
    end
  end
end

