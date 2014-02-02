class Asset < ActiveRecord::Base
  dragonfly_accessor :qrcode
  dragonfly_accessor :photo

  QRCODE_IMAGE_NAME = 'qrcode.png'

  def self.recent( limit = 10 )
    where( 'created_at > ?', 10.days.ago ).limit( limit )
  end


  def increment_num_photo_downloads!
    num = self.num_photo_downloads + 1
    self.update_attributes( num_photo_downloads: num )
  end
end

