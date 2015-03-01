require 'minitest'
require 'minitest/autorun'
require 'minitest/pride'
require_relative '../lib/logic'

class LogicTest < Minitest::Test 

	def test_this_file_works

		assert true
	end

	def test_the_colors_are_initialized_to_red_green_blue_and_yellow
		logic = Logic.new
		assert_equal ["r","g","b","y"],logic.colors
	end

	def test_it_returns_4_if_all_colors_match
		logic = Logic.new
		secret = ["r","r","r","r"]
		guess = ["r","r","r","r"]
		assert_equal 4,logic.check_for_matching_colors(secret,guess)
	end

	def test_it_returns_3_if_three_colors_match
		logic = Logic.new
		secret = ["r","r","r","y"]
		guess = ["r","r","r","r"]
		assert_equal 3,logic.check_for_matching_colors(secret,guess)
	end

	def test_it_returns_2_if_two_colors_match
		logic = Logic.new
		secret = ["r","r","y","y"]
		guess = ["r","r","r","r"]
		assert_equal 2,logic.check_for_matching_colors(secret,guess)
	end

	def test_it_returns_1_if_one_color_matches
		logic = Logic.new
		secret = ["r","y","y","y"]
		guess = ["r","r","r","r"]
		assert_equal 1,logic.check_for_matching_colors(secret,guess)
	end

	def test_it_returns_4_if_no_color_matches
		logic = Logic.new
		secret = ["y","y","y","y"]
		guess = ["r","r","r","r"]
		assert_equal 0,logic.check_for_matching_colors(secret,guess)
	end

	def test_it_returns_4_if_all_positions_match
		logic = Logic.new
		secret = ["b","y","g","r"]
		guess = ["b","y","g","r"]
		assert_equal 4,logic.check_for_matching_colors(secret,guess)
	end

	def test_it_returns_3_if_three_positions_match
		logic = Logic.new
		secret = ["y","y","g","r"]
		guess = ["b","y","g","r"]
		assert_equal 3,logic.check_for_matching_colors(secret,guess)
	end

	def test_it_returns_2_if_two_positions_match
		logic = Logic.new
		secret = ["y","y","g","r"]
		guess = ["b","b","g","r"]
		assert_equal 2,logic.check_for_matching_colors(secret,guess)
	end

	def test_it_returns_1_if_one_position_matches
		logic = Logic.new
		secret = ["b","b","b","r"]
		guess = ["y","y","y","r"]
		assert_equal 1,logic.check_for_matching_colors(secret,guess)
	end

	def test_it_returns_0_if_no_positions_match
		logic = Logic.new
		secret = ["b","y","g","g"]
		guess = ["r","r","r","r"]
		assert_equal 0,logic.check_for_matching_colors(secret,guess)
	end

end