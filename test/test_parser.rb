# frozen_string_literal: true

require "minitest/autorun"
require "text-engine/lexer"
require "text-engine/parser"

def goRight
  print "You went to the right"
end

def goLeft
  print "You went to the right"
end

def takeLanter
  print "You took the lantern"
end

COMMANDS = {
  "GO RIGHT": :goRight,
  "GO LEFT": :goLeft,
  "TAKE LANTERN": :takeLantern
}

class ParserText < Minitest::Test
  def test_get_recognized_commands
    lexer = Lexer.new(["GO", "RIGHT", "LEFT"])
    recognized_symbols = lexer.get_recognized_symbols("I WILL GO RIGHT")

    parser = Parser.new(recognized_symbols, COMMANDS)
    parser.get_recognized_commands
    assert(true)
  end
end
