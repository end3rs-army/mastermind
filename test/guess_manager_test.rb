require 'minitest'
require 'minitest/autorun'
require 'minitest/pride'
require_relative '../lib/guess_manager'

class GuessManagerTest < Minitest::Test 

	def test_this_file_works

		assert true
	end

	def test_it_initializes_a_blank_array_for_guess_history
		manager = GuessManager.new
		assert_equal [],manager.history 
	end

	def test_it_can_store_a_guess
		manager = GuessManager.new
		guess = [:incorrect, ["r", "r", "r", "r"], 1, 1, 5]
		manager.maintain_list_of_guesses(guess)
		assert_equal ["   r r r r\t     1\t\t       1\t   5"],manager.history
	end

	def test_it_can_store_multiple_guesses
		manager = GuessManager.new
		guess = [:incorrect, ["r", "r", "r", "r"], 1, 1, 5]
		manager.maintain_list_of_guesses(guess)
		manager.maintain_list_of_guesses(guess)
		manager.maintain_list_of_guesses(guess)
		assert_equal 3,manager.history.size
	end

end