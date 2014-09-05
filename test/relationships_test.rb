require_relative 'test_helper'
require_relative '../lib/sales_engine'
require_relative '../lib/merchant'
require_relative '../lib/invoice_repository'
require_relative '../lib/customer_repository'
require_relative '../lib/invoice_item_repository'


class RelationshipsTest < Minitest::Test
  attr_reader :merchant_repo, :items, :engine, :item_repo, :invoice_repo, :transaction_repo, :invoice_item_repo, :customer_repo

  def setup
    @engine = SalesEngine.new

    invoice_data       = [{id: "45", customer_id: "1", merchant_id: "6", status: "shipped", created_at: "2012-03-27 14:53:59 UTC", updated_at: "2012-03-25 09:54:09 UTC"},{id: "23", customer_id: "3", merchant_id: "6", status: "shipped", created_at: "2012-03-27 14:53:59 UTC", updated_at: "2012-03-25 09:54:09 UTC"}]
    transaction_data   = [{id: "1", invoice_id: "45", credit_card_number: "4654405418249632", credit_card_expiration_date: "", result: "success", created_at: "2012-03-27 14:54:09 UTC", updated_at: "2012-03-27 14:54:09 UTC" },{id: "2", invoice_id: "3", credit_card_number: "4654405418249632", credit_card_expiration_date: "", result: "success", created_at: "2012-03-27 14:54:09 UTC", updated_at: "2012-03-27 14:54:09 UTC" }]
    merchant_data      = [{id: "6", name: "Williamson Group", created_at: "2012-03-27 14:53:59 UTC", updated_at: "2012-03-27 16:12:25 UTC"}]
    item_data          = [{id: "1", name: "donut", description: "jelly-filled", unit_price: 75107, merchant_id: "6", created_at: "2012-03-27 14:53:59 UTC", updated_at: "2012-03-27 14:53:59 UTC"}, {id: "2", name: "donut", description: "chocolate-filled", unit_price: 75107, merchant_id: "6", created_at: "2012-03-27 14:53:59 UTC", updated_at: "2012-03-27 14:53:59 UTC"}]
    invoice_items_data = [{id: "1", item_id: "1", invoice_id: "45", quantity: "5",unit_price: 13635, created_at: "2012-03-27 14:54:09 UTC", updated_at: "2012-03-27 14:54:09 UTC" },{id: "2", item_id: "2", invoice_id: "45", quantity: "5",unit_price: 13635, created_at: "2012-03-27 14:54:09 UTC", updated_at: "2012-03-27 14:54:09 UTC" }]
    customer_data      = [{id: "1", first_name: "Joey", last_name: "Ondricka", created_at: "2012-03-27 14:54:09 UTC", updated_at: "2012-03-27 14:54:09 UTC"}, {id: "5", first_name: "Chris", last_name: "Navarrete", created_at: "2012-03-27 14:54:09 UTC", updated_at: "2012-03-27 14:54:09 UTC"}]

    @customer_repo     = CustomerRepository.new(engine, customer_data)
    @invoice_repo      = InvoiceRepository.new(engine, invoice_data)
    @transaction_repo  = TransactionRepository.new(engine, transaction_data)
    @merchant_repo     = MerchantRepository.new(engine, merchant_data)
    @item_repo         = ItemRepository.new(engine, item_data)
    @invoice_item_repo = InvoiceItemRepository.new(engine, invoice_items_data)

    @engine.item_repository         = item_repo
    @engine.merchant_repository     = merchant_repo
    @engine.invoice_repository      = invoice_repo
    @engine.transaction_repository  = transaction_repo
    @engine.invoice_item_repository = invoice_item_repo
    @engine.customer_repository     = customer_repo
  end


  def test_returns_name_of_merchant
    assert_equal "williamson group", merchant_repo.merchants.first.name
  end

  def test_it_returns_a_merchants_items
    assert_equal 2, merchant_repo.merchants.first.items.size
  end

  def test_it_returns_a_merchants_invoices
    assert_equal 2, merchant_repo.merchants.first.invoices.size
  end

  def test_invoices_can_return_their_transactions
    assert_equal 1, invoice_repo.invoices.first.transactions.size
  end

  def test_invoices_can_return_its_associated_invoice_items
    assert_equal 2, invoice_repo.invoices.first.invoice_items.size
  end

  def test_an_invoice_can_return_all_associated_items
    assert_equal 2, invoice_repo.invoices.first.items.size
  end

  def test_an_invoice_can_return_its_customer
    assert_equal "Joey", invoice_repo.invoices.first.customer.first_name
  end

  def test_an_invoice_can_return_its_merchant
    assert_equal "williamson group", invoice_repo.invoices.first.merchant.name
  end

  def test_an_invoice_item_can_find_its_invoice
    assert_equal 6, invoice_item_repo.all.first.invoice.merchant_id
  end

  def test_an_invoice_item_can_find_its_item
    assert_equal "chocolate-filled", invoice_item_repo.invoice_items.last.item.description
  end

  def test_an_item_can_return_all_its_invoice_items
    assert_equal 1, item_repo.items.first.invoice_items.size
  end
end


