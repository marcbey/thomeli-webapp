class TokenManager
  attr_reader :unicator
  attr_writer :token

  def initialize
    @unicator = lambda{ |token| Asset.where( token: token ).count.zero? }
  end

  def token
    @token ||= TokenGenerator.unique_token( self.unicator )
  end
end
