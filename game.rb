class Game
  def initialize(player1, player2)
    @players = [player1, player2]
    @current_player = player1
  end

  def start_game
    until game_over?
      question = MathQuestion.new
      answer = question.ask_question(@current_player.name)
      correct = question.check_answer(answer)

      if correct
        @current_player.update_score(1)
      else
        @current_player.reduce_lives
      end

      display_round_result

      switch_player
      display_scores

      puts "—— New Turn ——\n\n"
    end

    announce_winner
  end

  def switch_player
    @current_player = (@current_player == @players[0]) ? @players[1] : @players[0]
  end

  def display_round_result
    if @current_player.lives.positive?
      puts "#{@current_player.name}: Correct!"
    else
      puts "#{@current_player.name}: Seriously? No!"
    end
  end

  def display_scores
    puts "P1: #{@players[0].score}/3 vs P2: #{@players[1].score}/3"
  end

  def game_over?
    @players.any? { |player| player.lives.zero? }
  end

  def announce_winner
    winner = @players.max_by(&:score)
    loser = @players.min_by(&:score)

    puts "----- Game over! -------"
    puts "#{winner.name} wins with a score of #{winner.score}/3."
    puts "Final score: #{loser.name} - #{loser.score}/3"
    puts "Good Buy"
  end
end
