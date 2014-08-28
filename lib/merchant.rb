class Merchant
  attr_reader :id, :name, :created_at, :updated_at

  def initialize(row, repo)
    @id          = row[:id]
    @name        = (row[:name]).downcase
    @created_at  = row[:created_at]
    @updated_at  = row[:updated_at]
    @repo        = repo
  end

def items
  repo.find_items_by_merchant_id(self.id)
end