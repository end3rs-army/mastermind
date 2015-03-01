require 'minitest'
require 'minitest/autorun'
require 'minitest/pride'
require_relative '../lib/counter'

class CounterTest < Minitest::Test 

	def test_this_file_works

		assert true
	end

	def test_it_responds_to_getting_a_start_time
		counter = Counter.new
		assert counter.respond_to?(:start_time), "Counter should have a start_time"
	end

	def test_it_initializes_turns_to_zero
		counter = Counter.new
		assert_equal 0,counter.turn_count
	end

	def test_it_can_add_turns_to_the_turn_count
		counter = Counter.new
		counter.next_turn
		assert_equal 1,counter.turn_count
	end

	def test_it_can_calculate_a_stop_time
		counter = Counter.new
		sleep(3)
		assert_equal 3,counter.stop_time
	end

	def test_it_can_get_the_time
		counter = Counter.new
		time_1 = counter.get_time
		time_2 = Time.now
		result = time_2 - time_1
		assert result < 1
	end

end