require 'bank'

describe Bank do
  describe 'new account with no activity' do
    bank = Bank.new(statement = BankStatement.new)
    it 'starts with a balance of 0' do
      expect(bank.read_balance).to eq 0
    end
    it 'displays statement with empty account and no activity' do
      expect(statement.print_statement).to eq 'date || credit || debit || ba'\
      "lance\n"
    end
  end

  describe 'depositing' do
    bank = Bank.new(statement = BankStatement.new)
    it 'deposits 1000 pounds' do
      bank.deposit('10/01/2012', 1000)
      expect(bank.read_balance).to eq 1000
    end
    it 'prints statement for one deposit' do
      expect(statement.print_statement).to eq 'date || credit || debit || ba'\
      "lance\n10/01/2012 || 1000 || || 1000"
    end
    it 'prints statement for two deposits' do
      bank.deposit('13/01/2012', 2000)
      expect(statement.print_statement).to eq 'date || credit || debit || ba'\
      "lance\n13/01/2012 || 2000 || || 3000\n10/01/2012 || 1000 || || 1000"
    end
  end

  describe 'withdrawing' do
    bank = Bank.new(statement = BankStatement.new)
    it 'withdraws 1000 pounds' do
      bank.withdraw('10/01/2012', 1000)
      expect(bank.read_balance).to eq(-1000)
    end
    it 'prints statement for one withdrawal' do
      expect(statement.print_statement).to eq 'date || credit || debit || ba'\
      "lance\n10/01/2012 || || 1000 || -1000"
    end
    it 'prints statement for two withdrawals' do
      bank.withdraw('11/01/2012', 500)
      expect(statement.print_statement).to eq 'date || credit || debit || ba'\
      "lance\n11/01/2012 || || 500 || -1500\n10/01/2012 || || 1000 || -1000"
    end
  end

  describe 'printed full statement with headers for acceptance criteria' do
    bank = Bank.new(statement = BankStatement.new)
    it 'prints statement for two deposits and one withdrawal' do
      bank.deposit('10/01/2012', 1000)
      bank.deposit('13/01/2012', 2000)
      bank.withdraw('14/01/2012', 500)
      expect(statement.print_statement).to eq 'date || credit || debit || ba'\
      "lance\n14/01/2012 || || 500 || 2500\n13/01/2012 || 2000 || || 3000\n"\
      '10/01/2012 || 1000 || || 1000'
    end
  end
end
