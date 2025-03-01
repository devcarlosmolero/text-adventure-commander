class Lexer
  def initialize(allowed_symbols)
    @allowed_symbols = allowed_symbols
  end

  def get_allowed_symbols
    @allowed_symbols
  end
end
