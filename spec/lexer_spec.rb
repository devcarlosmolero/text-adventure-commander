# frozen_string_literal: true

require "rspec"
require "text-engine/lexer"
require "data"

RSpec.describe Lexer do
  describe "#get_recognized_symbols" do
    it "recognizes basic symbols in a sentence" do
      recognized_symbols = Lexer.get_recognized_symbols(TestData.allowed_symbols, "Go to the right and take the lantern.")
      expect(recognized_symbols).to eq(["GO", "RIGHT", "TAKE", "LANTERN"])
    end

    it "recognizes repeated symbols" do
      recognized_symbols = Lexer.get_recognized_symbols(TestData.allowed_symbols, "Go left, then go right, and go left again.")
      expect(recognized_symbols.tally).to eq("GO" => 3, "LEFT" => 2, "RIGHT" => 1)
    end

    it "ignores punctuation and non-allowed words" do
      recognized_symbols = Lexer.get_recognized_symbols(TestData.allowed_symbols, "I will go to the left, but I don't know if I should take the lantern...")
      expect(recognized_symbols).to eq(["GO", "LEFT", "TAKE", "LANTERN"])
    end

    it "is case-insensitive when recognizing symbols" do
      recognized_symbols = Lexer.get_recognized_symbols(TestData.allowed_symbols, "Go RIGHT, then LEFT, and TAKE the LANTERN.")
      expect(recognized_symbols).to eq(["GO", "RIGHT", "LEFT", "TAKE", "LANTERN"])
    end

    it "returns an empty array when no symbols are recognized" do
      recognized_symbols = Lexer.get_recognized_symbols(TestData.allowed_symbols, "I am just walking around, doing nothing special.")
      expect(recognized_symbols).to be_empty
    end

    it "recognizes symbols mixed with non-allowed words" do
      recognized_symbols = Lexer.get_recognized_symbols(TestData.allowed_symbols, "Take the lantern, go right, and then left to find the treasure.")
      expect(recognized_symbols).to eq(["TAKE", "LANTERN", "GO", "RIGHT", "LEFT"])
    end

    it "recognizes symbols at the beginning and end of a sentence" do
      recognized_symbols = Lexer.get_recognized_symbols(TestData.allowed_symbols, "Go take the lantern and go left.")
      expect(recognized_symbols).to eq(["GO", "TAKE", "LANTERN", "GO", "LEFT"])
    end

    it "ignores punctuation attached to symbols" do
      recognized_symbols = Lexer.get_recognized_symbols(TestData.allowed_symbols, "Go! Right? Left... Take the lantern!!")
      expect(recognized_symbols).to eq(["GO", "RIGHT", "LEFT", "TAKE", "LANTERN"])
    end

    it "recognizes 'AND' as a connector" do
      recognized_symbols = Lexer.get_recognized_symbols(TestData.allowed_symbols, "Go left and take the lantern.")
      expect(recognized_symbols).to eq(["GO", "LEFT", "TAKE", "LANTERN"])
    end

    it "recognizes 'AND' at the beginning of a sentence" do
      recognized_symbols = Lexer.get_recognized_symbols(TestData.allowed_symbols, "And go right, then take the lantern.")
      expect(recognized_symbols).to eq(["GO", "RIGHT", "TAKE", "LANTERN"])
    end

    it "recognizes 'AND' at the end of a sentence" do
      recognized_symbols = Lexer.get_recognized_symbols(TestData.allowed_symbols, "Take the lantern and go left and.")
      expect(recognized_symbols).to eq(["TAKE", "LANTERN", "GO", "LEFT"])
    end

    it "recognizes multiple occurrences of 'AND'" do
      recognized_symbols = Lexer.get_recognized_symbols(TestData.allowed_symbols, "Go left and take the lantern and go right.")
      expect(recognized_symbols).to eq(["GO", "LEFT", "TAKE", "LANTERN", "GO", "RIGHT"])
    end
  end
end
