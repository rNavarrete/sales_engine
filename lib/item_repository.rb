require 'csv'
require_relative '../lib/item'

class ItemRepository
	attr_reader :items

	def initialize
		csv = CSV.open("./data/items.csv", headers: true, header_converters: :symbol)
		@items = csv.collect {|row| Item.new(row)}
	end

	def all
		items
	end

end