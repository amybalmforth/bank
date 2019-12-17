require_relative 'bank_statement'
# bank class
class Bank
  def initialize(bank_statement)
    @balance = 0.00
    @bank_statement = bank_statement
  end

  def deposit(date, amount)
    return 'Deposits must be higher than zero' if amount < 0

    @balance += amount
    @bank_statement.statement << "#{date} || #{'%.2f' % amount} || || #{'%.2f' % @balance}"
  end

  def withdraw(date, amount)
    return 'Withdrawals must be higher than zero' if amount < 0

    @balance -= amount
    @bank_statement.statement << "#{date} || || #{'%.2f' % amount} || #{'%.2f' % @balance}"
  end

  def read_balance
    balance
  end

  private

  attr_reader :balance
end
