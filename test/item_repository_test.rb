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

	def test_it_returns_a_random_element
		assert_instance_of Item, items.random
	end

	def test_you_can_find_by_id
		results = items.find_by("id", "30")
		assert_equal "Item Eos Quia", results.name
	end

	def test_you_can_find_by_name
		results = items.find_by("name", "Item Quisquam Dolorem")
		assert_equal "101", results.id
	end

	def test_you_can_find_by_description
		description = "Iusto ratione illum. Adipisci est perspiciatis temporibus. Ducimus id dolorem voluptas eligendi repellat iure sit."
		results = items.find_by("description", description)
		assert_equal "11", results.id
	end

	def test_you_can_find_by_unit_price
		results = items.find_by("unit_price", "751.07")
		assert_equal "1", results.id
	end

	def test_you_can_find_by_merchant_id
		results = items.find_by("merchant_id", "2")
		assert_equal "16", results.id
	end
end






