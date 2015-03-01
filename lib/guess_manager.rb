class GuessManager

	attr_reader :history

	def initialize
		@history = []
	end

	def maintain_list_of_guesses(guess)
		@history <<  "   #{guess[1].join(" ")}\t     #{guess[2]}\t\t       #{guess[3]}\t   #{guess[4]}" 
	end
end


if __FILE__ == $0

	guess = [:incorrect, ["r", "r", "r", "r"], 1, 1, 5]

	guesses = GuessManager.new
	guesses.maintain_list_of_guesses(guess)
	print guesses.history
end

