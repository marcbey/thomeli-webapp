class Asset < ActiveRecord::Base
  dragonfly_accessor :qrcode
  dragonfly_accessor :photo

  QRCODE_IMAGE_NAME = 'qrcode.png'

  def self.recent( limit = 10 )
    where( 'created_at > ?', 10.days.ago ).limit( limit )
  end
end

