class Bank
  attr_reader :balance

  def initialize
    @balance = 0
    @statement = []
  end

  def deposit(date, amount)
    @balance += amount
    @statement << "Date: #{date} Credit: #{amount} Balance: #{@balance}"
  end

  def withdraw(date, amount)
    @balance -= amount
    @statement << "Date: #{date} Debit: #{amount} Balance: #{@balance}"
  end

  def statement
    return @statement.join("")
  end


end
