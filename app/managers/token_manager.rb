class TokenManager
  attr_reader :unicator

  def initialize
    @unicator = lambda{ |token| Qrcode.where( token: token ).count.zero? }
  end

  def token
    @token ||= TokenGenerator.unique_token( self.unicator )
  end
end
