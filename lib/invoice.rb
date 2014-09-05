require 'csv'

class Invoice

 attr_reader :id, :customer_id, :merchant_id, :status, :created_at, :updated_at
 def initialize(row, repo)
 	  @id          = (row[:id]).to_i
 	  @customer_id = (row[:customer_id]).to_i
 	  @merchant_id = (row[:merchant_id]).to_i
 	  @status      = row[:status]
 	  @created_at  = row[:created_at]
 	  @updated_at  = row[:updated_at]
    @repo        = repo
 	end

  def transactions
    @repo.find_all_transactions_by_invoice_id(self.id)
  end

  def successful_transactions
    transactions.find_all {|transaction|transaction.result == "success"}
  end

  def invoice_items
    @repo.find_all_invoice_items_by_invoice_id(self.id)
  end

  def invoice_total
    invoice_items.inject(0) {|sum, invoice_item| sum + invoice_item.total}
  end

  def items
    invoice_items.collect do |invoice_item|
      invoice_item.item
    end
  end

  def customer
    @repo.find_customer_by_customer_id(self.customer_id)
  end

  def merchant
    @repo.find_merchant_by_merchant_id(self.merchant_id)
  end

end
