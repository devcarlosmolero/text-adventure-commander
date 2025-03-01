class Lexer
  def initialize(allowed_symbols)
    @allowed_symbols = allowed_symbols
  end

  def get_recognized(input)
    recognized_array = []
    input_array = input.split(" ")
    input_array.each do |word|
      recognized_array << word if @allowed_symbols.include?(word)
    end
    recognized_array
  end

  def get_allowed_symbols
    @allowed_symbols
  end
end
