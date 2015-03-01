require 'minitest'
require 'minitest/autorun'
require 'minitest/pride'
require_relative '../lib/input_validator'

class InputValidatorTest < Minitest::Test 

	def test_this_file_works

		assert true
	end

	def test_that_a_good_string_is_valid
		validator = InputValidator.new
		assert_equal :valid,validator.good_string[0]
	end

	def test_that_an_empty_string_returns_no_input
		validator = InputValidator.new
		result = validator.check_length("")
		assert_equal :no_input,result[0]
	end

	def test_that_a_longer_than_required_string_returns_long_length
		validator = InputValidator.new
		result = validator.check_length("aaaaa")
		assert_equal :length_long,result[0]
	end

	def test_that_a_shorter_than_required_string_returns_short_length
		validator = InputValidator.new
		result = validator.check_length("aaa")
		assert_equal :length_short,result[0]
	end

	def test_that_a_string_with_correct_length_returns_valid
		validator = InputValidator.new
		result = validator.check_length("aaaa")
		assert_equal :valid,result[0]
	end

	def test_that_a_string_returns_invalid_colors_if_all_colors_are_input
		validator = InputValidator.new
		result = validator.check_colors("vvvv")
		assert_equal :invalid_colors,result[0]
	end

	def test_that_a_string_returns_invalid_colors_if_any_wrong_colors_are_input
		validator = InputValidator.new
		result = validator.check_colors("trrr")
		assert_equal :invalid_colors,result[0]
	end

	def test_that_a_string_returns_invalid_colors_if_numbers_are_input
		validator = InputValidator.new
		result = validator.check_colors("1111")
		assert_equal :invalid_colors,result[0]
	end

	def test_it_returns_valid_if_colors_are_valid
		validator = InputValidator.new
		result = validator.check_colors("rybg")
		assert_equal :valid,result[0]
	end

	def test_it_returns_valid_if_both_colors_and_length_are_correct
		validator = InputValidator.new
		result = validator.validate_guess("rybg")
		assert_equal :valid,result[0]
	end

	def test_it_returns_invalid_if_user_inputs_something_crazy
		validator = InputValidator.new
		result = validator.validate_guess("asdfqrtioafj123")
		assert_equal :length_long,result[0]
	end

	def test_it_returns_god_if_god_is_input_for_god_mode
		validator = InputValidator.new
		result = validator.validate_guess("god")
		assert_equal :god,result[0]
	end
end
