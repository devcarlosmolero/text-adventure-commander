require "text-engine/parser"
require "text-engine/lexer"

class TextEngine
  def initialize(commands)
    allowed_symbols = []
    commands.keys.map do |key|
      key.to_s.split("_").each do |part|
        allowed_symbols << part
      end
    end

    @allowed_symbols = allowed_symbols.uniq
    @parser = Parser.new(commands)
  end

  def print_available_commands
    options = []
    @parser.commands.each do |command, _|
      options << command.to_s.tr("_", " ").capitalize
    end

    "[Options: #{options.join(" | ")}]"
  end

  def get_commands_from(input)
    recognized_symbols = Lexer.get_recognized_symbols(@allowed_symbols, input)
    @parser.get_recognized_commands(recognized_symbols, input)
  end

  def execute_command(actor, command)
    actor.send(@parser.commands[command.tr(" ", "_").upcase.to_sym])
  end
end
