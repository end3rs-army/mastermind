require './turn'
require './menu'
require './counter'
require './randomizer'
require './guess_manager'
require './input_validator'

class Runner

	attr_reader :counter 

	def initialize
		@menu = Menu.new
		@turn = Turn.new
		@secret = Randomizer.new.create_random_sequence 
		@validator = InputValidator.new
		@counter = Counter.new
		@guess_history = GuessManager.new
		@input = ""
		@guess_check = [:start,nil,nil,nil,0]
	end

	def start_game
		clear
		@menu.show_start_menu
		@input = gets.chomp.downcase
		if @input == "i"
			system "clear"
			@menu.show_instructions
			start_game
		elsif @input == "p"
			run_game
		elsif @input == "q"
			quit_game
		else
			start_game
		end
	end

	def run_game
		clear
		@menu.show_start_game_menu
		until @input == "q" || @guess_check[0] == :win || @guess_check[0] == :lose
			@input = gets.chomp.downcase
			check = @validator.validate_guess(@input) 
			if check[0] == :valid
				clear
				@guess_check = @turn.execute_turn(@input,@secret)
				@guess_history.maintain_list_of_guesses(@guess_check)
				win_game if @guess_check[0] == :win 
				lose_game if @guess_check[0] == :lose 
			elsif @input == "q"
				quit_game
			elsif check[0] == :god
				clear
				@menu.show_secret_sequence(@secret)
				sleep(1.5)
			else
				clear
				@menu.show_error_message(check[0])
				sleep(1.5)
			end
			clear
			@menu.show_turn_menu(@guess_check[4],@guess_history.history) unless @input == "q" || @guess_check[0] == :win || @guess_check[0] == :lose
		end
	end

	def quit_game
		clear
		@menu.show_quit_menu
		sleep(2)
		clear
	end

	def win_game
		clear
		@menu.show_win_menu(@guess_check[4],@counter.stop_time,@secret)
		sleep(4)
		clear
	end

	def lose_game
		clear
		@menu.show_lose_menu(@counter.stop_time,@secret)
		sleep(4)
		clear
	end

	def clear

		system "clear"
	end
end

if __FILE__ == $0

	run = Runner.new
	run.start_game

end

