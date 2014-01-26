require 'digest/sha1'

class TokenManager
  attr_reader :photo_name, :base_url, :secret

  def initialize( photo_name )
    raise ArgumentError, 'Photo Name is missing!' if photo_name.blank?

    @photo_name = photo_name
    @secret = Rails.configuration.photo_secret
    @base_url = Rails.configuration.downloads_url
  end

  def url
    @url ||= "#{self.base_url}?token=#{self.token}"
  end

  def token
    @token ||= Digest::SHA1.hexdigest( "#{self.photo_name}+#{self.secret}" )
  end
end
