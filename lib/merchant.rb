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

  # def successful_transactions
  #   invoices.each do |invoice|
  #     invoice.successful_transactions
  #   end
  #   end
  # end

  # def total_revenue
  #   successful_transactions.each do |transaction|
  #     transaction.invoice.
  # end
end
