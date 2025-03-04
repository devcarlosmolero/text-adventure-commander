class Parser
  attr_reader :commands
  def initialize(commands)
    @commands = commands
  end

  def get_recognized_commands(recognized_symbols, input)
    recognized_commands = []
    commands_as_array = get_commands_as_array

    i = 0
    while i < recognized_symbols.length
      current_word = recognized_symbols[i].downcase
      next_word = recognized_symbols[i + 1]&.downcase

      if commands_as_array.include?([current_word, next_word])
        recognized_commands << "#{recognized_symbols[i]} #{recognized_symbols[i + 1]}"
        i += 2
      else
        i += 1
      end
    end

    recognized_commands.map { |command| command.tr(" ", "_").upcase }.uniq
  end

  private

  def get_commands_as_array
    @commands.keys.map { |key| key.to_s.downcase.split("_") }
  end
end
