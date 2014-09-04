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

  def invoice_items
    @repo.find_all_invoice_items_by_invoice_id(self.id)
  end

  def items
    #need to look more at this, maybe it's working?
    invoice_items.collect do |invoice_item|
      invoice_item.item
    end
  end

  def customer
    @repo.engine.customer_repository.find_by_id(self.customer_id)
  end

  def merchant
    @repo.engine.merchant_repository.find_by_id(self.merchant_id)
  end

end
