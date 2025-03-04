class TestData
  @@ALLOWED_SYMBOLS = ["OPEN", "FIRST", "SECOND", "THIRD", "KEEP", "WALKING"]
  @@COMMANDS = {
    OPEN_FIRST: {
      type: "navigation",
      to: "level_0#scene_1"
    },
    OPEN_SECOND: {
      type: "navigation",
      to: "level_0#scene_2"
    },
    OPEN_THIRD: {
      type: "navigation",
      to: "level_0#scene_3"
    },
    KEEP_WALKING: {
      type: "navigation",
      to: "level_0#scene_4"
    }
  }

  def self.allowed_symbols
    @@ALLOWED_SYMBOLS
  end

  def self.commands
    @@COMMANDS
  end
end
