class Asset < ActiveRecord::Base
  dragonfly_accessor :qrcode_image
  dragonfly_accessor :photo_image

  def self.recent( limit = 10 )
    where( 'created_at > ?', 10.days.ago ).limit( limit )
  end
end

