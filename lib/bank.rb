require_relative 'bank_statement'
# bank class
class Bank
  def initialize(bank_statement)
    @balance = 0
    @bank_statement = bank_statement
  end

  def deposit(date, amount)
    @balance += amount
    @bank_statement.statement << "#{date} || #{amount} || || #{@balance}"
  end

  def withdraw(date, amount)
    @balance -= amount
    @bank_statement.statement << "#{date} || || #{amount} || #{@balance}"
  end

  def read_balance
    balance
  end

  private

  attr_reader :balance
end
