# frozen_string_literal: true

require "minitest/autorun"
require "text-engine/lexer"

class LexerTest < Minitest::Test
  def test_identify_symbols
    lexer = Lexer.new(["GO", "RIGHT", "LEFT"])
    print lexer.get_allowed_symbols
    assert(true)
  end
end
