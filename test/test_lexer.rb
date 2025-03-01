# frozen_string_literal: true

require "minitest/autorun"
require "text-engine/lexer"

class LexerTest < Minitest::Test
  def test_get_recognized
    lexer = Lexer.new(["GO", "RIGHT", "LEFT"])
    recognized = lexer.get_recognized("I WILL GO RIGHT")
    correct = recognized.include?("GO") && recognized.include?("RIGHT")
    assert(true) if correct
    assert(false) if !correct
  end
end
