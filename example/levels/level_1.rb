require "text-engine"

class Level1
  ALLOWED_SYMBOLS = ["GO", "RIGHT", "LEFT", "TOP", "BOTTOM"]
  COMMANDS = {
    GO_RIGHT: :Right,
    GO_LEFT: :Left,
    GO_TOP: :Top,
    GO_BOTTOM: :Bottom
  }
  def self.Start
    text_engine = TextEngine.new(ALLOWED_SYMBOLS, COMMANDS)
    puts "Where do you want to go?"
    input = gets
    result = text_engine.get_commands_from(input)
    result[:recognized].each do |command|
      send(COMMANDS[command.tr(" ", "_").upcase.to_sym])
    end
  end

  def self.Right
    puts "You went to the right"
  end

  def self.Left
    puts "You went to the left"
  end

  def self.Top
    puts "You went to the top"
  end

  def self.Bottom
    puts "You went to the bottom"
  end
end
