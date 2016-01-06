class Game


  @@winning_move = { 
    rock: :scissors, 
    scissors: :paper, 
    paper: :rock }

  def initialize
    @num_players = ask_num_players
    @player1 = Human.new

    case num_players
    when 1
      @player2 = Computer.new
    when 2
      @player2 = Human.new
    end
    
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
    player1 = @players[player_index]
    move1 = player1.play
     
    switch_player
     
    player2 = @players[player_index]
    move2 = player2.play

    puts "#{player1.name} chose #{move1}"
    puts "#{player2.name} chose #{move2}"
    puts winner(player1,move1,player2,move2)

    print "Do you want to play again? (y or n): "
    answer = gets.chomp
    
    if answer == "y"
      setup()
      game_loop
    end
  end

end