require 'bank'

describe Bank do

  describe "balance" do
    it "starts with a balance of 0" do
      expect(subject.balance).to eq 0
    end
  end

  describe "depositing" do
    it "deposits 1000 pounds" do
      subject.deposit("10/01/2012", 1000)
      expect(subject.balance).to eq 1000
    end
  end

  describe "withdrawing" do
    it "withdraws 1000 pounds" do
      subject.withdraw("10/01/2012", 1000)
      expect(subject.balance).to eq -1000
    end
  end

  describe "empty statement" do
    it "displays statement with empty account and no activity" do
      expect(subject.access_statement).to eq "date || credit || debit || balance\n"
    end
  end

  describe "printed full statement with headers with one activity" do
    it "prints statement for one deposit" do
      subject.deposit("10/01/2012", 1000)
      expect(subject.access_statement).to eq "date || credit || debit || balance\n10/01/2012 || 1000 || || 1000"
    end
    it "prints statement for one withdrawal" do
      subject.withdraw("14/01/2012", 500)
      expect(subject.access_statement).to eq "date || credit || debit || balance\n14/01/2012 || || 500 || -500"
    end
  end

  describe "printed full statement with headers with two same activities" do
    it "prints statement for two deposits" do
      subject.deposit("10/01/2012", 1000)
      subject.deposit("13/01/2012", 2000)
      expect(subject.access_statement).to eq "date || credit || debit || balance\n13/01/2012 || 2000 || || 3000\n10/01/2012 || 1000 || || 1000"
    end
    it "prints statement for two withdrawals" do
      subject.withdraw("10/01/2012", 500)
      subject.withdraw("11/01/2012", 500)
      expect(subject.access_statement).to eq "date || credit || debit || balance\n11/01/2012 || || 500 || -1000\n10/01/2012 || || 500 || -500"
    end
  end

  describe "printed full statement with headers for acceptance criteria" do
    it "prints statement for two deposits and one withdrawal" do
      subject.deposit("10/01/2012", 1000)
      subject.deposit("13/01/2012", 2000)
      subject.withdraw("14/01/2012", 500)
      expect(subject.access_statement).to eq "date || credit || debit || balance\n14/01/2012 || || 500 || 2500\n13/01/2012 || 2000 || || 3000\n10/01/2012 || 1000 || || 1000"
    end
  end

end
