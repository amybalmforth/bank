# bank class
class Bank
  def initialize
    @balance = 0
    @statement = []
  end

  def deposit(date, amount)
    @balance += amount
    @statement << "#{date} || #{amount} || || #{@balance}"
  end

  def withdraw(date, amount)
    @balance -= amount
    @statement << "#{date} || || #{amount} || #{@balance}"
  end

  def read_balance
    balance
  end

  def access_statement
    print_statement
  end

  private

  attr_reader :balance

  def print_statement
    "date || credit || debit || balance\n" + @statement.reverse.join("\n")
  end
end
