class Bank
  attr_reader :balance

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

  def statement
    return @statement.join("\n")
  end

  def print_statement
    return "date || credit || debit || balance\n" + @statement.join("\n")
  end


end
