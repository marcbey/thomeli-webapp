class PhotoManager
  attr_reader :photo_path, :photo_name

  def initialize( photo_name )
    photos_directory = Rails.configuration.photos_drop_folder
    if not photos_directory.exist? or not photos_directory.readable?
      raise StandardError, 'Photo direcory missing!'
    end
    @photo_name = photo_name
    @photo_path = photos_directory.join( photo_name )
  end

  def self.photo_with_token( token, internal = false )
    raise ArgumentError if token.blank?

    asset = Asset.where( token: token ).first!
    photo_manager = new( asset.photo_name )

    asset.num_photo_downloads += 1 if not internal
    asset.save!

    return photo_manager
  end

  def photo_image
    @photo ||= File.read( self.photo_path )
  end

  def photo_image_exists?
    @photo_image_exists ||= File.exists?( self.photo_path )
  end

  def remove_photo_from_drop_folder
    File.delete( @photo_path )
  end
end

