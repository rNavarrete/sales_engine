require 'csv'
require_relative '../lib/merchant_repository'
require_relative '../lib/invoice_repository'
require_relative '../lib/item_repository'
require_relative '../lib/invoice_item_repository'
require_relative '../lib/customer_repository'
require_relative '../lib/transaction_repository'

class SalesEngine

  attr_reader :merchant_repository, :invoice_repository, :item_repository,
              :invoice_item_repository, :customer_repository, :transaction_repository

  def initialize

  end

  def startup
    @merchant_repository = MerchantRepository.new(self)
    @invoice_repository  = InvoiceRepository.new(self)
    @item_repository     = ItemRepository.new(self)
    @invoice_item_repository = InvoiceItemRepository.new(self)
    @customer_repository = CustomerRepository.new(self)
    @transaction_repository = TransactionRepository.new(self)
  end


end



if __FILE__ == $0
  engine = SalesEngine.new
  engine.startup

  engine.merchant_repository
  engine.invoice_repository
  engine.item_repository
  engine.invoice_item_repository
  engine.customer_repository
  engine.transaction_repository
end
