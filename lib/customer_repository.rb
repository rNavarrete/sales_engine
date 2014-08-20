require 'csv'
require_relative 'csv_handler'
require_relative 'customer'

class CustomerRepository
  attr_reader :customers, :engine

  def initialize(engine)
    csv       = CsvHandler.new("./data/customers.csv")
    @customers = csv.data.collect {|row| Customer.new(row, self)}
    @engine = engine
  end

  def all
    customers
  end

  def random
    customers.sample
  end

  def find_by_first_name(first_name)
    customers.detect {|customer| customer.first_name == first_name}
  end

  def find_by_last_name(last_name)
    customers.detect {|customer| customer.last_name == last_name}
  end

  def find_by_id(id)
    customers.detect {|customer| customer.id == id.to_s}
  end

  def find_by_created_at(created_at)
    customers.detect {|customer| customer.created_at == created_at}
  end

  def find_all_by_first_name(first_name)
    customers.select {|customer| customer.first_name == first_name}
  end

  def find_all_by_last_name(last_name)
    customers.select {|customer| customer.last_name == last_name}
  end

  def find_all_by_id(id)
    customers.select {|customer| customer.id == id.to_s}
  end

  def find_all_by_created_at(created_at)
    customers.select {|customer| customer.created_at == created_at}
  end
end
