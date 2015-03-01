class Logic

	attr_reader :colors

	def initialize
		@colors = ["r","g","b","y"]
	end

	def check_for_matching_colors(secret,guess)
		secret_colors = @colors.map {|color| secret.count{|secret_color| secret_color == color}}
		guess_colors = @colors.map {|color| guess.count{|guess_color| guess_color == color}}
		correct_colors = secret_colors.zip(guess_colors)
		correct_colors = correct_colors.reduce(0) {|sum,values| sum + values.min}	
	end

	def check_for_correct_positions(secret,guess)
		correct_positions = guess.each_with_index.count {|color,i| color == secret[i]} 
	end
end


if __FILE__ == $0

	secret = ["r","r","r","y"]
	guess = ["r","b","y","r"]
	logic = Logic.new
	puts logic.check_for_matching_colors(secret,guess)

end