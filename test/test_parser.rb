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

def openTreasure
  print "You opened the treasure"
end

COMMANDS = {
  GO_RIGHT: :goRight,
  GO_LEFT: :goLeft,
  TAKE_LANTERN: :takeLantern,
  OPEN_TREASURE: :openTreasure
}

ALLOWED_SYMBOLS = ["GO", "RIGHT", "LEFT", "TAKE", "LANTERN"]

class ParserText < Minitest::Test
  def test_get_recognized_commands_multiple_correct
    input = "I WILL GO RIGHT AND TAKE A LANTERN"
    lexer = Lexer.new(ALLOWED_SYMBOLS)
    recognized_symbols = lexer.get_recognized_symbols(input)

    parser = Parser.new(recognized_symbols, COMMANDS)
    result = parser._get_recognized_commands(input)

    is_correct = result[:recognized][0] == "go right" && result[:recognized][1] == "take lantern" && result[:unrecognized].length == 0
    assert(is_correct)
  end

  def test_get_recognized_commands_multiple_incorrect
    input = "I WILL RIGHT GO AND LANTERN TAKE"
    lexer = Lexer.new(ALLOWED_SYMBOLS)
    recognized_symbols = lexer.get_recognized_symbols(input)

    parser = Parser.new(recognized_symbols, COMMANDS)
    result = parser._get_recognized_commands(input)

    is_correct = result[:unrecognized][0] == "right go" && result[:unrecognized][1] == "lantern take"
    assert(is_correct)
  end

  def test_get_recognized_commands_single_correct
    input = "I WILL GO RIGHT"
    lexer = Lexer.new(ALLOWED_SYMBOLS)
    recognized_symbols = lexer.get_recognized_symbols(input)

    parser = Parser.new(recognized_symbols, COMMANDS)
    result = parser._get_recognized_commands(input)

    is_correct = result[:recognized][0] == "go right" && result[:unrecognized].length == 0
    assert(is_correct)
  end

  def test_get_recognized_commands_single_correct_duplicated_input
    input = "I WILL GO RIGHT FOR FOR"
    lexer = Lexer.new(ALLOWED_SYMBOLS)
    recognized_symbols = lexer.get_recognized_symbols(input)

    parser = Parser.new(recognized_symbols, COMMANDS)
    result = parser._get_recognized_commands(input)

    is_correct = result[:recognized][0] == "go right" && result[:unrecognized].length == 0
    assert(is_correct)
  end
end
