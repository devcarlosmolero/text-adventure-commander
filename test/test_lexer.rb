# frozen_string_literal: true

require "minitest/autorun"
require "text-engine/lexer"
require "data"

class LexerTest < Minitest::Test
  def test_allowed_symbols_includes_and
    lexer = Lexer.new(TestData::ALLOWED_SYMBOLS)
    assert(lexer.allowed_symbols.include?("AND"))
  end

  def test_get_recognized_symbols
    lexer = Lexer.new(TestData::ALLOWED_SYMBOLS)
    recognized_symbols = lexer._get_recognized_symbols("I WILL GO LEFT AND THEN GO RIGHT")
    is_correct = recognized_symbols.tally["GO"] == 2 && recognized_symbols.include?("RIGHT") && recognized_symbols.include?("LEFT")
    assert(is_correct)
  end
end
