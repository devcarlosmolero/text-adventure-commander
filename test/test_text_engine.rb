# frozen_string_literal: true

require "minitest/autorun"
require "text-engine"
require "data"

class TextEngineTest < Minitest::Test
  def test_dummy
    text_engine = TextEngine.new(TestData::ALLOWED_SYMBOLS, TestData::COMMANDS)
    result = text_engine.get_commands_from("I will go to the left and take the lantern")

    is_correct = result[:recognized][0] == "go left" && result[:recognized][1] == "take lantern" && result[:unrecognized].empty?
    assert(is_correct)
  end
end
