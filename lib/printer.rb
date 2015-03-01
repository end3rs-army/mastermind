class Printer

	def start_menu
		["====== W E L C O M E   T O   M A S T E R M I N D ======",
	     "\n\n",
		 "(p)lay   (q)uit   (i)nstructions".center(55)]
	end

	def mastermind_header
		["================= M A S T E R M I N D =================",
	     "\n"]
	end

	def start_game
		["\n",
		 "Please make your first guess.".center(55),
		 "\n",
		 "(.e.g. 'rbyg' for red, blue, yellow, green)".center(55),
		 "\n"]
	end

	def turns_left(turns = 0)
		"You have #{10-turns} turns left!\n".center(55)
	end

	def guess_header
		"  YOUR GUESS\tRIGHT COLORS\tRIGHT POSITION\t TURN"	  
	end

	def input_menu
		"\nEnter a guess or (q)uit => "
	end

	def invalid_colors
		["\n\n",
		 "That is an invalid color, please try again.".center(55)]
	end

	def no_input
		["\n\n",
		 "You have to input something!! Try again.".center(55)]
	end

	def length_long
		["\n\n",
		 "That guess is too long, please try again.".center(55)]
	end

	def length_short
		["\n\n",
		 "That guess is too short, please try again.".center(55)]
	end

	def valid_length
		"VALID LENGTH"
	end

	def incorrect
		"\nThat guess was incorrect, please try again.".center(55)
	end

	def win
		"YOU WIN"
	end

	def valid
		""
	end
		 
	def mastermind_instructions
		["=============== I N S T R U C T I O N S ===============",
		 "\n\n",
		 "Mastermind is a game where you try to guess the".center(55),
		 "sequence of colors (red, green, blue, yellow).".center(55),
		 "You will have 15 chances to guess correctly. After".center(55),
		 "each guess you will be told how many positions you".center(55),
		 "got correct as well as how many colors. Good luck!".center(55),
		 "\n\n",
		 "you will be returned to main menu shortly".center(55)]
	end

	def quit
		["\n",
		 "YOU HAVE QUIT THE GAME!".center(55),
		 "\n"]
	end

	def win_tally(turns,time,secret)
		["\n",
		 "WINNER!!".center(55),
		 "\n",
		 "You have guessed the sequence correctly:".center(55),
		 "\n",
		 "#{secret}".center(55),
		 "\n",
		 "in #{turns} turns and #{time} seconds.".center(55)]
	end

	def lose_tally(time,secret)
		["\n",
		 "YOU'RE A LOSER!".center(55),
		 "\n",
		 "The correct sequence was:".center(55),
		 "\n",
		 "#{secret}".center(55),
		 "\n",
		 "you spent #{time} seconds losing this game.".center(55)]
	end

	def secret_sequence(secret)
		["\n",
		 "The secret code is:".center(55),
		 "\n",
		 "#{secret}".center(55)]
	end

end

if __FILE__ == $0

	printer = Printer.new
	puts printer.turns_left(10)

end