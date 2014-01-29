class QrcodeImage
  include Skeptick
  attr_reader :url, :width, :height, :width_x_height, :tempfile_qrcode, :tempfile_url_as_string

  def initialize( url )
    @url = "http://photo.melinat.de/TO2W-GECA-ZAKI-GIHA-0123"
    @width = 400
    @height = 400
    @width_x_height = "#{@width}x#{@height}"
  end

  def qrcode
    qrcode_image = RQRCode::QRCode.new( self.url, :size => 10, :level => :h ).to_img
    resized_image = qrcode_image.resize( self.width, self.height )
 
    @tempfile_qrcode = Tempfile.new( 'qrcode.png' )
    resized_image.save( @tempfile_qrcode.path  )
  end

  def url_as_png
    @tempfile_url_as_string = Rails.root.join( 'tmp', 'b.png' )
    text = image do
      canvas :none, size: width_x_height
      font   'Nimbus Mono'
      set    :pointsize, 14
      write  self.url, left: 30, top: 390
    end
    

    command = convert( text, to: @tempfile_url_as_string )
    command.build
  end

  def read
    self.qrcode
    self.url_as_png

    tempfile_qrcode_with_url = Tempfile.new( 'qrcode_with_url.png' )
    b = Rails.root.join( 'tmp', 'b.png' )

    command = compose(:over, tempfile_qrcode.path, tempfile_url_as_string, to: tempfile_qrcode_with_url.path) do
      set :resize, width_x_height
    end

    command.build

    File.read( tempfile_qrcode_with_url )
  end
end
