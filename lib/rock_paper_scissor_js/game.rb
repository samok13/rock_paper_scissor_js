class Game

  @@winning_move = { 
    rock: :scissors, 
    scissors: :paper, 
    paper: :rock }

  def initialize
    setup
  end

  def setup
    @num_players = ask_num_players
    @player1 = Human.new

    case @num_players
    when 1
      @player2 = Computer.new
    when 2
      @player2 = Human.new
    end
    game_loop
  end

  def ask_num_players
    print "How many players? (1 or 2): "
    players = gets.chomp.to_i
    if players == 1 || players == 2
      players
    else
      ask_num_players
    end
  end

  def game_loop()
    move1 = @player1.play
    move2 = @player2.play

    puts winner(move1,move2)

    print "Do you want to play again? (y or n): "
    answer = gets.chomp
    
    if answer == "y"
      setup()
      game_loop
    end


  end

  def winner(move1, move2)
    if @@winning_move[move1] == move2
      puts "#{@player1.name} wins!"
    elsif @@winning_move[move2] == move1
       puts "#{@player2.name} wins!"
    else 
      puts "Game is a draw."
    end
  end

end