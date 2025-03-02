# frozen_string_literal: true

require "minitest/autorun"
require "text-engine/lexer"
require "text-engine/parser"
require "data"

class ParserText < Minitest::Test
  def test_get_recognized_commands_multiple_correct
    input = "Okay, I will go to the right and take the lantern"
    lexer = Lexer.new(TestData::ALLOWED_SYMBOLS)
    recognized_symbols = lexer._get_recognized_symbols(input)

    parser = Parser.new(TestData::COMMANDS)
    result = parser._get_recognized_commands(recognized_symbols, input)

    is_correct = result[:recognized][0] == "go right" && result[:recognized][1] == "take lantern" && result[:unrecognized].empty?
    assert(is_correct)
  end

  def test_get_recognized_commands_multiple_incorrect
    input = "I think I will right go and lantern take"
    lexer = Lexer.new(TestData::ALLOWED_SYMBOLS)
    recognized_symbols = lexer._get_recognized_symbols(input)

    parser = Parser.new(TestData::COMMANDS)
    result = parser._get_recognized_commands(recognized_symbols, input)

    is_correct = result[:unrecognized][0] == "right go" && result[:unrecognized][1] == "lantern take"
    assert(is_correct)
  end

  def test_get_recognized_commands_single_correct
    input = "Ok, I'm gonna go to the right"
    lexer = Lexer.new(TestData::ALLOWED_SYMBOLS)
    recognized_symbols = lexer._get_recognized_symbols(input)

    parser = Parser.new(TestData::COMMANDS)
    result = parser._get_recognized_commands(recognized_symbols, input)

    is_correct = result[:recognized][0] == "go right" && result[:unrecognized].empty?
    assert(is_correct)
  end

  def test_get_recognized_commands_single_correct_duplicated_input
    input = "I will go to... Idk, the right"
    lexer = Lexer.new(TestData::ALLOWED_SYMBOLS)
    recognized_symbols = lexer._get_recognized_symbols(input)

    parser = Parser.new(TestData::COMMANDS)
    result = parser._get_recognized_commands(recognized_symbols, input)

    is_correct = result[:recognized][0] == "go right" && result[:unrecognized].empty?
    assert(is_correct)
  end
end
