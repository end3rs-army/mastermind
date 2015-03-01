require_relative './logic'
require_relative './counter'

class Turn

	attr_reader :guess, :turn_counter, :logic 

	def initialize(length = 4)
		@logic = Logic.new
		@turn_counter = Counter.new
		@length = length
	end

	def analyze_guess_for_win(secret,guess,turns)
		correct_colors = @logic.check_for_matching_colors(secret,guess)
		correct_positions = @logic.check_for_correct_positions(secret,guess)
		return [:win,guess,correct_colors,correct_positions,turns] if correct_positions == @length
		return [:lose,guess,correct_colors,correct_positions,turns] if turns == 10	
		return [:incorrect,guess,correct_colors,correct_positions,turns] if correct_positions != @length
	end 

	def execute_turn(input,secret = "rrrr")
		guess = input.split("")
		secret = secret.split("")
		analyze_guess_for_win(secret,guess,@turn_counter.next_turn)
	end
end

if __FILE__ == $0

	game = Turn.new
	print game.execute_turn("rrrr","rygb")

end