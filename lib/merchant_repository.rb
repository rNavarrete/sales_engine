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
    @merchants = data.collect {|row| Merchant.new(row)}
  end

  def all
  	merchants
  end

  def random
  	merchants.sample
  end

  def find_by(type, query)
  	merchants.detect {|merchant| merchant.send(type.downcase.to_sym) == query.downcase}
  end

  def find_all_by(type, query)
  	merchants.select {|merchant| merchant.send(type.downcase.to_sym) == query.downcase}
  end
end
