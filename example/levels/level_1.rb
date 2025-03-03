require "text-adventure-commander"

class Level1
  COMMANDS = {
    GO_RIGHT: :go_right,
    GO_LEFT: :go_left,
    GO_TOP: :go_top,
    GO_BOTTOM: :go_bottom
  }
  def self.Start
    commander = TextAdventureCommander.new(COMMANDS)
    puts "Where do you want to go? #{commander.print_available}"
    input = gets
    result = commander.get(input)
    puts result
    result[:recognized].each do |command|
      commander.execute(Level1, command)
    end
  end

  def self.go_right
    puts "You went to the right"
  end

  def self.go_left
    puts "You went to the left"
  end

  def self.go_top
    puts "You went to the top"
  end

  def self.go_bottom
    puts "You went to the bottom"
  end
end
