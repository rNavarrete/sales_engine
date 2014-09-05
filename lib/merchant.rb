class Merchant
  attr_reader :id, :name, :created_at, :updated_at, :repo

  def initialize(row, repo=nil)
    @id          = row[:id].to_i
    @name        = (row[:name]).downcase
    @created_at  = row[:created_at]
    @updated_at  = row[:updated_at]
    @repo        = repo
  end

  def items
    repo.find_items_by_merchant_id(self.id)
  end

  def invoices
    repo.find_invoices_by_merchant_id(self.id)
  end

  def successful_invoices
    invoices.find_all {|invoice| invoice.successful_invoice?}
  end

  def total_revenue
    successful_invoices.inject(0) {|sum, invoice| sum + invoice.total}
  end
end
