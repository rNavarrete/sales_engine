require_relative 'test_helper'
require_relative '../lib/item_repository'

class ItemRepositoryTest < Minitest::Test
	attr_reader :items

	def setup
		@items = ItemRepository.new
	end

	def test_it_returns_all_items
		results = items.all
		assert_equal 2483, items.all.count
		
	end
	
end