require 'csv'
require_relative "merchant"

class MerchantRepository
	attr_reader :filepath, :merchants

  def initialize(filepath="./data/merchants.csv")
    @filepath = filepath
    load
  end

  def load
    data = CSV.open(filepath, headers: true, header_converters: :symbol)
    @merchants = data.map {|row| Merchant.new(row)}
  end

  def all
  	merchants
  end

  def random
  	merchants.sample
  end

  def find_by_name(name)
  	merchants.select {|merchant| merchant.name == name}
  end
end
