class Lexer
  def initialize(allowed_symbols)
    @allowed_symbols = allowed_symbols
  end

  def get_recognized_symbols(input)
    recognized_symbols = []
    input_array = input.split(" ")
    input_array.each do |word|
      recognized_symbols << word if @allowed_symbols.include?(word)
    end
    recognized_symbols
  end

  def get_allowed_symbols
    @allowed_symbols
  end
end
