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
        input = "Okay, I will open first and keep walking"
        recognized_symbols = Lexer.get_recognized_symbols(TestData.allowed_symbols, input)
        result = parser.get_recognized_commands(recognized_symbols, input)

        expect(result).to contain_exactly("OPEN_FIRST", "KEEP_WALKING")
      end
    end

    context "with multiple incorrect commands" do
      it "returns no recognized commands" do
        input = "I think I will first open and walking keep"
        recognized_symbols = Lexer.get_recognized_symbols(TestData.allowed_symbols, input)
        result = parser.get_recognized_commands(recognized_symbols, input)

        expect(result).to be_empty
      end
    end

    context "with a single correct command" do
      it "recognizes the command" do
        input = "Ok, I'm gonna open first"
        recognized_symbols = Lexer.get_recognized_symbols(TestData.allowed_symbols, input)
        result = parser.get_recognized_commands(recognized_symbols, input)

        expect(result).to contain_exactly("OPEN_FIRST")
      end
    end

    context "with duplicated input" do
      it "recognizes the correct command and ignores duplicates" do
        input = "I will open first, open first again"
        recognized_symbols = Lexer.get_recognized_symbols(TestData.allowed_symbols, input)
        result = parser.get_recognized_commands(recognized_symbols, input)

        expect(result).to contain_exactly("OPEN_FIRST")
      end
    end

    context "with mixed correct and incorrect commands" do
      it "recognizes valid commands" do
        input = "Open first, keep walking, and then jump high"
        recognized_symbols = Lexer.get_recognized_symbols(TestData.allowed_symbols, input)
        result = parser.get_recognized_commands(recognized_symbols, input)

        expect(result).to contain_exactly("OPEN_FIRST", "KEEP_WALKING")
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
        input = "Open FIRST, then SECOND, and KEEP WALKING"
        recognized_symbols = Lexer.get_recognized_symbols(TestData.allowed_symbols, input)
        result = parser.get_recognized_commands(recognized_symbols, input)

        expect(result).to contain_exactly("OPEN_FIRST", "KEEP_WALKING")
      end
    end

    context "with punctuation attached to commands" do
      it "ignores punctuation and recognizes valid commands" do
        input = "Open! First? Second... Keep walking!!"
        recognized_symbols = Lexer.get_recognized_symbols(TestData.allowed_symbols, input)
        result = parser.get_recognized_commands(recognized_symbols, input)

        expect(result).to contain_exactly("OPEN_FIRST", "KEEP_WALKING")
      end
    end
  end
end
