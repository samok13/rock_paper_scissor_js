require_relative "player.rb"

class Computer < Player
  attr_accessor :name
  
  def initialize
    @name = "AI"
  end

  def play
    @@possible_moves.sample.to_sym
  end
end