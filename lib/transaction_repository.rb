require 'csv'
require_relative '../lib/csv_handler'
require_relative '../lib/transaction'

class TransactionRepository
  attr_reader :transactions, :engine

  def initialize(engine, params)
    @engine = engine
    @transactions = params.collect {|row| Transaction.new(row, self)}
  end

  def all
    transactions
  end

  def random
    transactions.sample
  end

  def find_by_id(id)
    transactions.detect {|transaction| transaction.id == id}
  end

  def find_by_invoice_id(id)
    transactions.detect {|transaction| transaction.invoice_id == id}
  end

  def find_by_credit_card_number(cc_num)
    transactions.detect {|transaction| transaction.credit_card_number == cc_num}
  end

  def find_by_credit_card_expiration(cc_exp)
    transactions.detect {|transaction| transaction.credit_card_expiration == cc_exp}
  end

  def find_by_result(result)
    transactions.detect {|transaction| transaction.result == result}
  end

  def find_by_created_at(created_at)
    transactions.detect {|transaction| transaction.created_at == created_at}
  end

  def find_by_updated_at(updated_at)
    transactions.detect {|transaction| transaction.updated_at == updated_at}
  end

  def find_all_by_id(id)
    transactions.select {|transaction| transaction.id == id}
  end

  def find_all_by_invoice_id(id)
    transactions.select {|transaction| transaction.invoice_id == id}
  end

  def find_all_by_credit_card_number(cc_num)
    transactions.select {|transaction| transaction.credit_card_number == cc_num}
  end

  def find_all_by_credit_card_expiration(cc_exp)
    transactions.select {|transaction| transaction.credit_card_expiration == cc_exp}
  end

  def find_all_by_result(result)
    transactions.select {|transaction| transaction.result == result}
  end

  def find_all_by_created_at(created_at)
    transactions.select {|transaction| transaction.created_at == created_at}
  end

  def find_all_by_updated_at(updated_at)
    transactions.select {|transaction| transaction.updated_at == updated_at}
  end

end
