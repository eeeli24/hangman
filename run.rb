require 'yaml'

require_relative 'lib/dictionary'
require_relative 'lib/word'
require_relative 'lib/game'

game = Hangman::Game.new
game.play