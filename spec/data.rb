class TestData
  @@ALLOWED_SYMBOLS = ["GO", "RIGHT", "LEFT", "TAKE", "LANTERN"]
  @@COMMANDS = {
    GO_RIGHT: :go_right,
    GO_LEFT: :go_left,
    TAKE_LANTERN: :take_lantern,
    OPEN_TREASURE: :open_treasure
  }

  def self.allowed_symbols
    @@ALLOWED_SYMBOLS
  end

  def self.commands
    @@COMMANDS
  end

  def self.go_right
    puts "You went to the right"
  end

  def self.go_left
    puts "You went to the left"
  end

  def self.take_lantern
    puts "You took the lantern"
  end

  def self.open_treasure
    puts "You opened the treasure"
  end
end
