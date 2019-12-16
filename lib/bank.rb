class Bank
  attr_reader :balance

  def initialize
    @balance = 0
  end

  def deposit(amount)
    @balance += 1000
  end



end
