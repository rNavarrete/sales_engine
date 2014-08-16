require_relative 'test_helper'
require_relative '../lib/merchant_repository'

class MerchantRepositoryTest < Minitest::Test
	attr_reader :merchant_repository

	def setup
		filepath = "./data/merchants.csv"
		@merchant_repository = MerchantRepository.new
	end

	def test_it_returns_all_instances_of_merchant
		assert_equal 100, merchant_repository.all.count
	end

	def test_it_returns_a_random_merchant
		result = merchant_repository.random
		assert_instance_of Merchant, result
	end

	def test_it_finds_by_name
		results = merchant_repository.find_by_name("Bechtelar LLC")
		assert_equal "Bechtelar LLC", results.first.name
	end



end	