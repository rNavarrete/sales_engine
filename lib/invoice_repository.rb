require 'csv'
require_relative 'invoice'

class InvoiceRepository
	attr_reader :invoices
	
	def initialize
		data      = CSV.open("./data/invoices.csv", headers: true, header_converters: :symbol)
		@invoices = data.each {|row| Invoice.new(row)}
	end

	def method_name
		
	end
end