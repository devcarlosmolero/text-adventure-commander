# frozen_string_literal: true

require "rspec"
require "text-engine"
require "data"

RSpec.describe TextEngine do
  let(:commands) { TestData.commands }
  let(:text_engine) { described_class.new(commands) }

  describe "#get_commands_from" do
    it "recognizes valid commands and returns no unrecognized commands" do
      input = "I will go to the left and take the lantern"
      result = text_engine.get_commands_from(input)

      expect(result).to contain_exactly("go left", "take lantern")
    end

    it "returns unrecognized commands when input contains invalid commands" do
      input = "I will jump high and run fast"
      result = text_engine.get_commands_from(input)

      expect(result).to be_empty
    end
  end

  describe "#print_available_commands" do
    it "returns a formatted string with available commands" do
      expected_output = "[Options: Go right | Go left | Take lantern | Open treasure]"
      expect(text_engine.print_available_commands).to eq(expected_output)
    end
  end

  describe "#execute_command" do
    before do
      allow(TestData).to receive(:go_left).and_return("You go left.")
      allow(TestData).to receive(:take_lantern).and_return("You take the lantern.")
    end

    it "executes the 'go left' command and returns the correct result" do
      command = "go left"
      expect(text_engine.execute_command(TestData, command)).to eq("You go left.")
    end

    it "executes the 'take lantern' command and returns the correct result" do
      command = "take lantern"
      expect(text_engine.execute_command(TestData, command)).to eq("You take the lantern.")
    end
  end
end
