require_relative 'test_helper'
require_relative '../lib/sales_engine'


class MerchantTest < Minitest::Test
	attr_reader :merchant, :engine

	def setup
		@engine = SalesEngine.new
		row = {:id => "1", :name => "Schroeder-Jerde", :created_at => "2012-03-27 14:53:59 UTC", :updated_at => "2012-03-27 14:53:59 UTC"}
		@merchant = Merchant.new(row, engine.merchant_repository)
	end

	def test_it_exists
		assert Merchant
	end

	def test_returns_name_of_merchant
	  assert_equal "schroeder-jerde", merchant.name
	end

	def test_returns_id_of_mercahnt
		assert_equal "1", merchant.id
	end

	def test_returns_when_merchant_was_created
		assert_equal "2012-03-27 14:53:59 UTC", merchant.created_at
	end

	def test_returns_when_merchant_was_updated
		assert_equal "2012-03-27 14:53:59 UTC", merchant.updated_at
	end

	def test_it_can_find_its_items
  	assert_equal 4, merchant.items.count
  end
end


