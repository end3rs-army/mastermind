require_relative './lib/game_flow'

class Runner

	attr_accessor :game 

	def initialize
		@game = GameFlow.new
	end
end

run = Runner.new
run.game.start_game