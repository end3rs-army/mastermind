class Randomizer

	def create_random_sequence(length = 4)
		(1..length).map { ["r","y","b","g"].to_a[rand(4)] }.join
	end

end

if __FILE__ == $0

	random = Randomizer.new
	result = random.create_random_sequence
	puts result.class

end