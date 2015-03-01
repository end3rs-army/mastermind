require 'minitest'
require 'minitest/autorun'
require 'minitest/pride'
require_relative '../lib/menu'
require_relative '../lib/printer'

class MenuTest < Minitest::Test 

	def test_this_file_works

		assert true
	end

	def test_it_has_menus
		menu_items = [:show_start_menu,:show_start_game_menu,
					 :show_win_menu,:show_lose_menu,:show_secret_sequence,
					 :show_turn_menu,:show_quit_menu,:show_guess_header,
					 :show_instructions,:show_error_message,:show_input_menu,
					 :show_turns_left]
		menu = Menu.new
		menu_items.each do |item|
    	assert menu.respond_to?(item), "Menu should have a #{message} method"
  		end
  	end

  	def test_it_initializes_a_printer
  		menu = Menu.new
  		assert menu.printer
  	end

end