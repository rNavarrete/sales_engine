require 'csv'
require_relative 'test_helper'
require_relative '../lib/customer'


class CustomersTest < Minitest::Test
  attr_reader :customer_repo

  def setup
    csv = CSV.open("./data/customers_test.csv", headers: true, header_converters: :symbol)
    @customer_repo = csv.collect {|row| Customer.new(row)}
  end

  def test_it_can_store_its_customer_id
    assert_equal 1, customer_repo.first.id
  end

  def test_it_can_give_out_its_first_name
    assert_equal "Joey", customer_repo.first.first_name
  end

  def test_it_can_give_out_its_last_name
    assert_equal "Ondricka", customer_repo.first.last_name
  end

  def test_it_Can_give_out_when_it_was_created
    assert_equal "2012-03-27 14:54:09 UTC", customer_repo.first.created_at
  end

  def test_it_Can_give_out_when_it_was_updated
    assert_equal "2012-03-27 14:54:09 UTC", customer_repo.first.updated_at
  end
end