# frozen_string_literal: true

require "rspec"
require "text-adventure-commander/lexer"
require "data"

RSpec.describe Lexer do
  describe "#get_recognized_symbols" do
    it "recognizes basic symbols in a sentence" do
      recognized_symbols = Lexer.get_recognized_symbols(TestData.allowed_symbols, "Open first and keep walking")
      expect(recognized_symbols).to eq(["OPEN", "FIRST", "KEEP", "WALKING"])
    end

    it "recognizes repeated symbols" do
      recognized_symbols = Lexer.get_recognized_symbols(TestData.allowed_symbols, "Open first, then open second, and open first again.")
      expect(recognized_symbols.tally).to eq("OPEN" => 3, "FIRST" => 2, "SECOND" => 1)
    end

    it "ignores punctuation and non-allowed words" do
      recognized_symbols = Lexer.get_recognized_symbols(TestData.allowed_symbols, "I will open the first, but I don't know if I should keep walking...")
      expect(recognized_symbols).to eq(["OPEN", "FIRST", "KEEP", "WALKING"])
    end

    it "is case-insensitive when recognizing symbols" do
      recognized_symbols = Lexer.get_recognized_symbols(TestData.allowed_symbols, "Open FIRST, then SECOND, and KEEP WALKING.")
      expect(recognized_symbols).to eq(["OPEN", "FIRST", "SECOND", "KEEP", "WALKING"])
    end

    it "returns an empty array when no symbols are recognized" do
      recognized_symbols = Lexer.get_recognized_symbols(TestData.allowed_symbols, "I am just chilling, doing nothing special.")
      expect(recognized_symbols).to be_empty
    end

    it "recognizes symbols mixed with non-allowed words" do
      recognized_symbols = Lexer.get_recognized_symbols(TestData.allowed_symbols, "Open the first, keep walking, and then open second.")
      expect(recognized_symbols).to eq(["OPEN", "FIRST", "KEEP", "WALKING", "OPEN", "SECOND"])
    end

    it "recognizes symbols at the beginning and end of a sentence" do
      recognized_symbols = Lexer.get_recognized_symbols(TestData.allowed_symbols, "Open first and keep walking.")
      expect(recognized_symbols).to eq(["OPEN", "FIRST", "KEEP", "WALKING"])
    end

    it "ignores punctuation attached to symbols" do
      recognized_symbols = Lexer.get_recognized_symbols(TestData.allowed_symbols, "Open! First? Second... Keep walking!!")
      expect(recognized_symbols).to eq(["OPEN", "FIRST", "SECOND", "KEEP", "WALKING"])
    end
  end
end
