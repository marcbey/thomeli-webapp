class Qrcode < ActiveRecord::Base
  dragonfly_accessor :qrcode

  scope :recent, ->(limit = 10) { where('created_at > ?', 10.days.ago).limit( limit ) }
end

