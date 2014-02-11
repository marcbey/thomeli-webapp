class PhotoImporter
  attr_reader :photo_drop_folder, :valid_extensions

  def initialize
    @photo_drop_folder = Rails.configuration.photos_drop_folder
    @valid_extensions = %w( .gif .jpg .jpeg .png )
  end

  def import
    self.photo_drop_folder.each_entry do |photo_name|
      if self.valid_extensions.include?( photo_name.extname.downcase )
        Rails.logger.info "Start importing photo #{photo_name}..."
        self.import_photo( photo_name.to_s )
      end
    end
  rescue Errno::EACCES => exception
    Rails.logger.info "Error accessing file: #{exception}"
  end

  def import_photo( photo_name )
    token_manager = TokenManager.new
    qrcode_manager = QrcodeManager.new( token_manager, photo_name )
    photo_manager = PhotoManager.new( photo_name )
    asset_manager = AssetManager.new( qrcode_manager, photo_manager, photo_name )
    asset_manager.save!
  end
end

