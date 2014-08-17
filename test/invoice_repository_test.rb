require_relative 'test_helper'
require_relative '../lib/invoice_repository'

class InvoiceRepositoryTest < Minitest::Test
  attr_reader :repository
	
	def setup
    @repository = InvoiceRepository.new
	end

	def test_it_can_return_all
	assert_equal 4843, repository.invoices.all.count		
	end	
end