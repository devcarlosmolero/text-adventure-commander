class Parser
  def initialize(recognized_symbols, commands)
    @recognized_symbols = recognized_symbols
    @commands = commands
  end

  def get_recognized_commands
    available_commands = @commands.keys
    available_commands.each do |command|
      print command
    end
  end
end
