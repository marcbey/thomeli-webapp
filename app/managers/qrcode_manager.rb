class QrcodeManager
  attr_reader :token_manager, :photo_name, :url, :height, :width, :size, :level

  # Level can be l, m, q, h
  # Size must be 4..10
  HEIGHT, WIDTH, SIZE, LEVEL = 300, 300, 10, :h

  def initialize( token_manager, photo_name, dimensions='' )
    @token_manager = token_manager
    @photo_name = photo_name

    dimensions = dimensions.to_s.split( ',' )
    @height = ( dimensions[0] || HEIGHT ).to_i
    @width  = ( dimensions[1] || WIDTH ).to_i
    @size   = ( dimensions[2] || SIZE ).to_i
    @level  = ( dimensions[3] || LEVEL ).to_sym

    @url = "#{Rails.configuration.token_url}/#{self.token}"
  end

  def dimensions
    "#{self.height},#{self.width},#{self.size},#{self.level}"
  end

  def self.qrcode_by_token( token )
    raise ArgumentError, 'Token is missing' if token.blank?

    Asset.where( token: token ).first!
  end

  def token
    @token ||= begin
      if @asset = Asset.where( photo_name: self.photo_name ).first
        if self.dimensions == @asset.qrcode_dimensions
          @qrcode_image = @asset.qrcode.data
        end
        self.token_manager.token = @token = @asset.token
      else
        @token = self.token_manager.token
      end
    end
  end

  def qrcode_image
    @qrcode_image ||= begin
      qrcode_image = RQRCode::QRCode.new( self.url, size: self.size, level: self.level ).to_img
      qrcode_image.resize( self.height, self.width )
    end
  end
end

