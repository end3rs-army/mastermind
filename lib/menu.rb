require_relative './printer'

class Menu
	
	attr_reader :printer

	def initialize

		@printer = Printer.new
	end

	def show_start_menu

		puts @printer.start_menu 
	end

	def show_start_game_menu
		puts @printer.mastermind_header
		puts @printer.start_game 
		print @printer.input_menu
	end

	def show_win_menu(turns,time,secret)
		puts @printer.mastermind_header
		puts @printer.win_tally(turns,time,secret)
	end

	def show_lose_menu(time,secret)
		puts @printer.mastermind_header
		puts @printer.lose_tally(time,secret)
	end

	def show_secret_sequence(secret)
		puts @printer.mastermind_header
		puts @printer.secret_sequence(secret) 
	end

	def show_turn_menu(turns,guess_history)
		puts @printer.mastermind_header
		show_turns_left(turns)
		show_guess_header
		puts guess_history
		show_input_menu
	end

	def show_quit_menu
		puts @printer.mastermind_header
		puts @printer.quit
	end

	def show_guess_header

		puts @printer.guess_header 
	end

	def show_instructions
		puts @printer.mastermind_instructions
		sleep(10)
	end

	def show_error_message(message)
		puts @printer.mastermind_header
		puts @printer.send(message)
		sleep(2)
	end

	def show_input_menu

		print @printer.input_menu 
	end

	def show_turns_left(turns)
		
		puts @printer.turns_left(turns)
	end

end

if __FILE__ == $0

	menu = Menu.new
	menu.show_instructions

end