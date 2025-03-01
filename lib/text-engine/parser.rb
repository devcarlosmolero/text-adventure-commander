require "text-engine/utils"

class Parser
  include Utils
  def initialize(recognized_symbols, commands)
    @recognized_symbols = recognized_symbols
    @commands = commands
  end

  def _get_recognized_commands(input)
    commands = @commands.keys
    recognized_commands = []
    unrecognized_commands = []
    unrecognized_hint = nil

    if _is_multiple?
      normalize_array(@recognized_symbols, "and").each do |part|
        if commands.to_s.downcase.include?(part.tr(" ", "_"))
          recognized_commands << part
        else
          unrecognized_commands << part
          unrecognized_hint = "Check the order of the symbols."
        end
      end
    end

    if !_is_multiple?
      part = normalize_array(@recognized_symbols, " ").join(" ")
      recognized_commands << part if commands.to_s.downcase.include?(part.tr(" ", "_"))
      if !commands.to_s.downcase.include?(part.tr(" ", "_"))
        unrecognized_commands << part
        unrecognized_hint = "If you're trying to invoke more than 1 command use 'AND' to join them."
      end
    end

    {
      recognized: recognized_commands,
      unrecognized: unrecognized_commands,
      unrecognized_hint: unrecognized_hint
    }
  end

  def _is_multiple?
    @recognized_symbols.include?("AND")
  end
end
