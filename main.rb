require_relative 'player'
require_relative 'game'
require_relative 'math_question'

# Create players
player1 = Player.new('Player 1')
player2 = Player.new('Player 2')

# Create game and start
game = Game.new(player1, player2)
game.start_game
