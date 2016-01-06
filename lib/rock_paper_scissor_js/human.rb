require_relative "player.rb"


class Human < Player
  attr_accessor :name
  def initialize
    @name = ask_name
  end

  def ask_name
    print "Enter your name: "
    return gets.chomp
  end

  def ask_move
    print "Enter your move: "
    move = gets.chomp.downcase
    if @@possible_moves.include?(move)
      move
    else
      puts "Invalid move"
      ask_move
    end
  end

  def play
    ask_move.to_sym
  end
end