require_relative 'test_helper'
require_relative '../lib/sales_engine'
require_relative '../lib/merchant'



class RelationshipsTest < Minitest::Test
  attr_reader :merchant_repository, :items, :engine, :item_repo

  def setup
    @engine    = SalesEngine.new
    merchant_data = [{id: "6", name: "Williamson Group", created_at: "2012-03-27 14:53:59 UTC", updated_at: "2012-03-27 16:12:25 UTC"}]
    @merchant_repository = MerchantRepository.new(engine, merchant_data)
    item_data  = [{id: "1", name: "donut", description: "jelly-filled", unit_price: 75107, merchant_id: "6", created_at: "2012-03-27 14:53:59 UTC", updated_at: "2012-03-27 14:53:59 UTC"}, {id: 1, name: "donut", description: "chocolate-filled", unit_price: 75107, merchant_id: "6", created_at: "2012-03-27 14:53:59 UTC", updated_at: "2012-03-27 14:53:59 UTC"}]
    @item_repo = ItemRepository.new(engine, item_data)

    @engine.item_repository = item_repo
    @engine.merchant_repository = merchant_repository

  end


  def test_returns_name_of_merchant
    assert_equal "williamson group", merchant_repository.merchants.first.name
  end

  def test_it_returns_a_merchants_items
    assert_equal 2, merchant_repository.merchants.first.items.size
  end
end


