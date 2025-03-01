# frozen_string_literal: true

require "minitest/autorun"
require "text-engine/lexer"

class LexerTest < Minitest::Test
  def test_get_recognized_symbols
    lexer = Lexer.new(["GO", "RIGHT", "LEFT"])
    recognized_symbols = lexer.get_recognized_symbols("I WILL GO RIGHT")
    correct = recognized_symbols.include?("GO") && recognized_symbols.include?("RIGHT")
    assert(true) if correct
    assert(false) if !correct
  end
end
