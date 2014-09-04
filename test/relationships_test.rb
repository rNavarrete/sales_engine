require_relative 'test_helper'
require_relative '../lib/sales_engine'
require_relative '../lib/merchant'
require_relative '../lib/invoice_repository'


class RelationshipsTest < Minitest::Test
  attr_reader :merchant_repository, :items, :engine, :item_repo, :invoice_repo

  def setup
    @engine    = SalesEngine.new
    invoice_data = [{id: "45", customer_id: "1", merchant_id: "6", status: "shipped", created_at: "2012-03-27 14:53:59 UTC", updated_at: "2012-03-25 09:54:09 UTC"},{id: "23", customer_id: "1", merchant_id: "6", status: "shipped", created_at: "2012-03-27 14:53:59 UTC", updated_at: "2012-03-25 09:54:09 UTC"}]
    @invoice_repo = InvoiceRepository.new(engine, invoice_data)



    merchant_data = [{id: "6", name: "Williamson Group", created_at: "2012-03-27 14:53:59 UTC", updated_at: "2012-03-27 16:12:25 UTC"}]
    @merchant_repository = MerchantRepository.new(engine, merchant_data)
    item_data  = [{id: "1", name: "donut", description: "jelly-filled", unit_price: 75107, merchant_id: "6", created_at: "2012-03-27 14:53:59 UTC", updated_at: "2012-03-27 14:53:59 UTC"}, {id: 1, name: "donut", description: "chocolate-filled", unit_price: 75107, merchant_id: "6", created_at: "2012-03-27 14:53:59 UTC", updated_at: "2012-03-27 14:53:59 UTC"}]
    @item_repo = ItemRepository.new(engine, item_data)



    @engine.item_repository = item_repo
    @engine.merchant_repository = merchant_repository
    @engine.invoice_repository = invoice_repo

  end


  def test_returns_name_of_merchant
    assert_equal "williamson group", merchant_repository.merchants.first.name
  end

  def test_it_returns_a_merchants_items
    assert_equal 2, merchant_repository.merchants.first.items.size
  end

  def test_it_returns_a_merchants_invoices
    assert_equal 4, merchant_repository.merchants.first.invoices.size
  end
end


