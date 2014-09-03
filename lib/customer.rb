
class Customer
  attr_reader :id, :first_name, :last_name, :created_at, :updated_at, :repo

  def initialize(row, repo=nil)
    @id          = row[:id].to_i
    @first_name  = row[:first_name]
    @last_name   = row[:last_name]
    @created_at  = row[:created_at]
    @updated_at  = row[:updated_at]
    @repo = repo
  end

  def invoices
  	repo.engine.invoice_repository.find_all_by_customer_id(self.id)
  end
end
