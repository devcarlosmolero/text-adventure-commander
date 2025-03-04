# frozen_string_literal: true

require "rspec"
require "text-adventure-commander"
require "data"

RSpec.describe TextAdventureCommander do
  let(:commands) { TestData.commands }
  let(:commander) { described_class.new(commands) }

  describe "#get_commands_from" do
    it "recognizes valid commands and returns no unrecognized commands" do
      input = "I will open the first door and then open the second one"
      result = commander.get_commands_from(input)

      expect(result).to contain_exactly("OPEN_FIRST", "OPEN_SECOND")
    end

    it "returns unrecognized commands when input contains invalid commands" do
      input = "I will jump high and run fast"
      result = commander.get_commands_from(input)

      expect(result).to be_empty
    end
  end

  describe "#print_available_commands" do
    it "returns a formatted string with available commands" do
      expected_output = "[Options: Open first | Open second | Open third | Keep walking]"
      expect(commander.print_available_commands).to eq(expected_output)
    end
  end

  describe "#get_command" do
    it "returns the command from the hash" do
      command = "OPEN_SECOND"
      expect(commander.get_command(command)).to eq({type: "navigation", to: "level_0#scene_2"})
    end
  end
end
