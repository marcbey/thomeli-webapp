class Asset < ActiveRecord::Base
  dragonfly_accessor :qrcode
  dragonfly_accessor :photo

  def self.recent( limit = 10 )
    where( 'created_at > ?', 10.days.ago ).limit( limit )
  end
end

