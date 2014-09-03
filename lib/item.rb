require 'bigdecimal'

class Item
  attr_reader :id, :name, :description, :unit_price, :merchant_id, :created_at, :updated_at, :repo

  def initialize(row, repo=nil)
    @id          = (row[:id]).to_i
    @name        = row[:name]
    @description = row[:description]
    @unit_price  = BigDecimal.new((row[:unit_price].to_f / 100).to_s)
    @merchant_id = (row[:merchant_id]).to_i
    @created_at  = row[:created_at]
    @updated_at  = row[:updated_at]
    @repo = repo
  end
end
