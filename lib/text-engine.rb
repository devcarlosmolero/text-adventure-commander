require "text-engine/parser"
require "text-engine/lexer"

class TextEngine
  include Lexer
  include Parser

  def initialize
  end
end
