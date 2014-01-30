module TokenGenerator
  extend self

  CHARS  = ('a'..'z').to_a
  VOWELS = %w( a e i o u )
  CONSONANT = CHARS - VOWELS

  BLOCKS = 5
  BLOCK_LENGTH = 4 # must be divisible by 2
  SEPERATOR = '+'

  PREFIX_REGEX = /^([A-Z0-9]{2})([0-9])([A-Z])$/i

  def unique_token( unicator )
    begin
      token = generate
    end while not unicator.call( token )

    return token
  end

  private

  def generate
    code = []

    BLOCKS.times do
      code << generate_block
    end

    return code.join( SEPERATOR ).upcase
  end

  def generate_block
    block = ''

    ( BLOCK_LENGTH / 2 ).times do
      block << CONSONANT[rand( CONSONANT.length )]
      block << VOWELS[rand( VOWELS.length )]
    end

    return block
  end
end
