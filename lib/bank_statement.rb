require_relative 'bank'
# bank statement class
class BankStatement
  attr_reader :statement

  def initialize
    @statement = []
  end

  def print_statement
    "date || credit || debit || balance\n" + @statement.reverse.join("\n")
  end
end
