require 'minitest'
require 'minitest/autorun'
require 'minitest/pride'
require_relative '../lib/printer'

class PrinterTest < Minitest::Test 

	def test_this_file_works

		assert true
	end

	def test_it_has_printer_methods
		methods = [:start_menu,:mastermind_header,:start_game,
				   :turns_left,:guess_header,:input_menu,
				   :invalid_colors,:no_input,:length_long,
				   :length_short,:valid_length,:incorrect,:win,
				   :valid,:mastermind_instructions,:quit,
				   :win_tally,:lose_tally,:secret_sequence]
		printer = Printer.new
		methods.each do |method|
			assert printer.respond_to?(method), "Printer should have a #{method} method"
		end
	end
end