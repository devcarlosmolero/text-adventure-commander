class TextEngine
  def initialize(allowed_symbols, commands)
    @lexer = Lexer.new(allowed_symbols)
    @parser = Parser.new(commands)
  end

  def get_commands_from(input)
    recognized_symbols = @lexer._get_recognized_symbols(input)
    @parser._get_recognized_commands(recognized_symbols, input)
  end
end

require "text-engine/parser"
require "text-engine/lexer"
