class Lexer
  attr_reader :allowed_symbols
  def initialize(allowed_symbols)
    @allowed_symbols = allowed_symbols
  end

  def get_recognized_symbols(input)
    recognized_symbols = []
    input_array = input.gsub(/[^a-zA-Z\s]/, "").split(" ")
    input_array.each do |word|
      recognized_symbols << word.upcase if @allowed_symbols.include?(word.upcase)
    end
    recognized_symbols
  end
end
