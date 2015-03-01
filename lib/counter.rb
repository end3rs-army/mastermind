class Counter

	attr_accessor :turn_count
	attr_reader :start_time

	def initialize
		@turn_count = 0
		@start_time = get_time
	end

	def get_time
		Time.now
	end

	def next_turn
		@turn_count += 1
	end

	def stop_time
		(get_time - @start_time).to_i
	end
end

if __FILE__ == $0

	count = Counter.new
	sleep(2)
	puts count.get_time
	puts Time.now
end