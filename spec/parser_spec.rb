# frozen_string_literal: true

require "rspec"
require "text-adventure-commander/lexer"
require "text-adventure-commander/parser"
require "data"

RSpec.describe Parser do
  let(:parser) { Parser.new(TestData.commands) }

  describe "#get_recognized_commands" do
    context "with multiple correct commands" do
      it "recognizes valid commands" do
        input = "Okay, I will go to the right and take the lantern"
        recognized_symbols = Lexer.get_recognized_symbols(TestData.allowed_symbols, input)
        result = parser.get_recognized_commands(recognized_symbols, input)

        expect(result).to contain_exactly("go right", "take lantern")
      end
    end

    context "with multiple incorrect commands" do
      it "returns no recognized commands" do
        input = "I think I will right go and lantern take"
        recognized_symbols = Lexer.get_recognized_symbols(TestData.allowed_symbols, input)
        result = parser.get_recognized_commands(recognized_symbols, input)

        expect(result).to be_empty
      end
    end

    context "with a single correct command" do
      it "recognizes the command" do
        input = "Ok, I'm gonna go to the right"
        recognized_symbols = Lexer.get_recognized_symbols(TestData.allowed_symbols, input)
        result = parser.get_recognized_commands(recognized_symbols, input)

        expect(result).to contain_exactly("go right")
      end
    end

    context "with duplicated input" do
      it "recognizes the correct command and ignores duplicates" do
        input = "I will go to idk, go to the right?"
        recognized_symbols = Lexer.get_recognized_symbols(TestData.allowed_symbols, input)
        result = parser.get_recognized_commands(recognized_symbols, input)

        expect(result).to contain_exactly("go right")
      end
    end

    context "with mixed correct and incorrect commands" do
      it "recognizes valid commands" do
        input = "Go right, take the lantern, and then jump high"
        recognized_symbols = Lexer.get_recognized_symbols(TestData.allowed_symbols, input)
        result = parser.get_recognized_commands(recognized_symbols, input)

        expect(result).to contain_exactly("go right", "take lantern")
      end
    end

    context "with no valid commands" do
      it "returns no recognized commands" do
        input = "Run fast and jump high"
        recognized_symbols = Lexer.get_recognized_symbols(TestData.allowed_symbols, input)
        result = parser.get_recognized_commands(recognized_symbols, input)

        expect(result).to be_empty
      end
    end

    context "with commands in different cases" do
      it "recognizes commands regardless of case" do
        input = "Go RIGHT, then LEFT, and TAKE the LANTERN"
        recognized_symbols = Lexer.get_recognized_symbols(TestData.allowed_symbols, input)
        result = parser.get_recognized_commands(recognized_symbols, input)

        expect(result).to contain_exactly("go right", "take lantern")
      end
    end

    context "with punctuation attached to commands" do
      it "ignores punctuation and recognizes valid commands" do
        input = "Go! Right? Left... Take the lantern!!"
        recognized_symbols = Lexer.get_recognized_symbols(TestData.allowed_symbols, input)
        result = parser.get_recognized_commands(recognized_symbols, input)

        expect(result).to contain_exactly("go right", "take lantern")
      end
    end
  end
end
