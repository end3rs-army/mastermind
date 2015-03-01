require 'minitest'
require 'minitest/autorun'
require 'minitest/pride'
require_relative '../lib/turn'

class TurnTest < Minitest::Test 

	def test_this_file_works

		assert true
	end

	def test_it_initializes_the_logic_engine
		turn = Turn.new
		assert turn.respond_to?(:logic)
	end

	def test_it_initializes_a_turn_counter
		turn = Turn.new
		assert turn.respond_to?(:turn_counter)
	end

	def test_it_can_amalyze_an_incorrect_guess
		turn = Turn.new
		result = turn.analyze_guess_for_win(["r","r","r","r"],["r","g","g","r"],10)
		assert_equal :incorrect,result[0]
	end

	def test_it_can_amalyze_a_winning_guess
		turn = Turn.new
		result = turn.analyze_guess_for_win(["r","r","r","r"],["r","r","r","r"],10)
		assert_equal :win,result[0]
	end

	def test_it_returns_lose_if_turns_equal_15_and_guess_is_still_incorrect
		turn = Turn.new
		result = turn.analyze_guess_for_win(["r","g","r","r"],["r","r","r","r"],15)
		assert_equal :lose,result[0]
	end 

	def test_it_returns_win_if_turns_equal_15_and_guess_is_correct
		turn = Turn.new
		result = turn.analyze_guess_for_win(["r","r","r","r"],["r","r","r","r"],15)
		assert_equal :win,result[0]
	end 

	def test_it_initializes_a_secret_to_rrrr_and_analyze_for_win
		turn = Turn.new
		result = turn.execute_turn("rrrr")
		assert_equal :win,result[0]
	end

	def test_it_can_take_secret_and_input_strings_and_then_analyze_them_for_win
		turn = Turn.new
		result = turn.execute_turn("rrrg","rrrg")
		assert_equal :win,result[0]
	end

	def test_it_can_take_secret_and_input_strings_and_then_analyze_them_for_incorrect
		turn = Turn.new
		result = turn.execute_turn("rrrg","rrrr")
		assert_equal :incorrect,result[0]
	end
end