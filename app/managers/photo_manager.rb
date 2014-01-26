class PhotoManager
  attr_reader :photo_path, :photo_name

  def initialize( photo_name )
    photos_directory = Rails.root.join( 'photos' )
    if not photos_directory.exist? or not photos_directory.readable?
      raise StandardError, 'Photo direcory missing!'
    end
    @photo_name = photo_name
    @photo_path = photos_directory.join( photo_name )
  end
  
  def self.photo_with_token( token_string, internal = false )
    raise ArgumentError if token_string.blank?

    qrcode = Qrcode.where( token: token_string ).first!
    photo_manager = new( qrcode.imagename )

    qrcode.num_photo_downloads += 1 if not internal
    qrcode.save!

    return photo_manager
  end

  def photo
    @photo ||= File.read( self.photo_path )
  end

  def photo_exists?
    @photo_exists ||= File.exists?( self.photo_path )
  end
end
