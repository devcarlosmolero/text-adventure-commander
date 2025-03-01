# frozen_string_literal: true

require "minitest/autorun"
require "text-engine/lexer"

class LexerTest < Minitest::Test
  def test_allowed_symbols_includes_and
    lexer = Lexer.new(["GO", "RIGHT", "LEFT"])
    assert(lexer.allowed_symbols.include?("AND"))
  end

  def test_get_recognized_symbols
    lexer = Lexer.new(["GO", "RIGHT", "LEFT"])
    recognized_symbols = lexer._get_recognized_symbols("I WILL GO LEFT AND THEN GO RIGHT")
    correct = recognized_symbols.tally["GO"] == 2 && recognized_symbols.include?("RIGHT") && recognized_symbols.include?("LEFT")
    assert(true) if correct
    assert(false) if !correct
  end
end
