class Lexer
  attr_reader :allowed_symbols
  def initialize(allowed_symbols)
    @allowed_symbols = allowed_symbols
    @allowed_symbols << "AND"
  end

  def _get_recognized_symbols(input)
    recognized_symbols = []
    input_array = input.split(" ")
    input_array.each do |word|
      recognized_symbols << word if @allowed_symbols.include?(word.upcase)
    end
    recognized_symbols
  end
end
