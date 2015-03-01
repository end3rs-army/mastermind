class InputValidator

	attr_reader :good_string

	def initialize
		@good_string = [:valid]
	end

	def check_length(string,length = 4)
		return [:no_input] if string == ""
		return [:length_long] if string.length > length
		return [:length_short] if string.length < length
		@good_string
	end

	def check_colors(string)
		return [:invalid_colors] unless string.scan(/[rgby]/).count == 4
		@good_string
	end

	def validate_guess(string)
		return [:god] if string == "god"
		length_correct = check_length(string)
		return length_correct if length_correct != @good_string
		colors_correct = check_colors(string)
		return colors_correct if colors_correct != @good_string
		@good_string
	end

end

if __FILE__ == $0
	
	parse = InputValidator.new
	print parse.validate_guess("god")

end