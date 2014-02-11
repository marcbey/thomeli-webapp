class Asset < ActiveRecord::Base
  dragonfly_accessor :qrcode
  dragonfly_accessor :photo

  QRCODE_IMAGE_NAME = 'qrcode.png'

  def self.recent( limit = 10 )
    where( 'created_at > ?', 10.days.ago ).limit( limit )
  end

  def self.public
    where( 'assets.photo_uid IS NOT NULL' )
  end

  def self.with_token( token )
    where( token: token )
  end

  def increment_num_photo_downloads!
    num = self.num_photo_downloads + 1
    self.update_attributes( num_photo_downloads: num, last_downloaded_at: Time.now )
  end


  def self.photo_empty_eq( selection )
    if selection == 1
      where( 'assets.photo_uid IS NOT NULL' )
    elsif selection == 0
      where( 'assets.photo_uid IS NULL' )
    else
      scoped
    end
  end

  #re-define the search method:
  search_method :photo_empty_eq, :type => :integer
end

