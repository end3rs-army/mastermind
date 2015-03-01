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
		check_length = check_length(string)
		return check_length if check_length != @good_string
		check_colors = check_colors(string)
		return check_colors if check_colors != @good_string
		@good_string
	end

end

if __FILE__ == $0
	
	parse = InputValidator.new
	print parse.validate_guess("god")

end