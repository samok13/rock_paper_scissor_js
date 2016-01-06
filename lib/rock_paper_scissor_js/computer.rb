require_relative "player.rb"

class Computer < Player
  def initialize
    @name = "AI"
  end

  def play
    @@possible_moves.sample.to_sym
  end
end