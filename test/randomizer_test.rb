require 'minitest'
require 'minitest/autorun'
require 'minitest/pride'
require_relative '../lib/randomizer'

class RandomizerTest < Minitest::Test 

	def test_this_file_works

		assert true
	end

	def test_it_creates_a_string
		sequence = Randomizer.new.create_random_sequence
		assert_equal String,sequence.class
	end

	def test_it_creates_a_four_character_default_string
		sequence = Randomizer.new.create_random_sequence
		assert_equal 4,sequence.length
	end

	def test_it_can_create_a_larger_string_if_specified
		sequence = Randomizer.new.create_random_sequence(8)
		assert_equal 8,sequence.length
	end

	def test_only_rgby_are_characters_in_random_sequence
		sequence = Randomizer.new.create_random_sequence
		assert_equal 4,sequence.scan(/[rbgy]/).count
	end
end