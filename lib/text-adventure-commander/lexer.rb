class Lexer
  def self.get_recognized_symbols(allowed_symbols, input)
    recognized_symbols = []
    input_array = input.gsub(/[^a-zA-Z\s]/, "").split(" ")
    input_array.each do |word|
      recognized_symbols << word.upcase if allowed_symbols.include?(word.upcase)
    end
    recognized_symbols
  end
end
