class Bank
  attr_reader :balance

  def initialize
    @balance = 0
    @statement = []
  end

  def deposit(date, amount)
    @balance += amount
    @statement << "Date: #{date} Credit: #{amount}"
  end

  def withdraw(amount)
    @balance -= amount
  end

  def statement
    return @statement.join("")
  end


end
