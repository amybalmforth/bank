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
    it "deposits 2000 pounds" do
      subject.deposit("13/01/2012", 2000)
      expect(subject.balance).to eq 2000
    end
  end

  describe "withdrawing" do
    it "withdraws 500 pounds" do
      subject.withdraw("10/01/2012", 500)
      expect(subject.balance).to eq -500
    end
    it "withdraws 1000 pounds" do
      subject.withdraw("10/01/2012", 1000)
      expect(subject.balance).to eq -1000
    end
  end

  describe "statement after 1 activity" do
    it "displays statement with empty account and no activity" do
      expect(subject.statement).to eq ""
    end
    it "displays statement after deposit of 1000 pounds" do
      subject.deposit("10/01/2012", 1000)
      expect(subject.statement).to eq "10/01/2012 || 1000 || || 1000"
    end
    it "displays statement after withdrawal of 1000 pounds" do
      subject.withdraw("10/01/2012", 1000)
      expect(subject.statement).to eq "10/01/2012 || || 1000 || -1000"
    end
  end

  describe "statement after 2 activities" do
    it "makes two deposits" do
      subject.deposit("10/01/2012", 1000)
      subject.deposit("10/01/2012", 500)
      expect(subject.statement).to eq "10/01/2012 || 1000 || || 1000\n10/01/2012 || 500 || || 1500"
    end
    it "makes two withdrawals" do
      subject.withdraw("10/01/2012", 500)
      subject.withdraw("10/01/2012", 500)
      expect(subject.statement).to eq "10/01/2012 || || 500 || -500\n10/01/2012 || || 500 || -1000"
    end
    it "makes a deposit and a withdrawal" do
      subject.deposit("11/01/2012", 1000)
      subject.withdraw("12/01/2012", 500)
      expect(subject.statement).to eq "11/01/2012 || 1000 || || 1000\n12/01/2012 || || 500 || 500"
    end
  end

  describe "printed full statement" do
    it "prints statement with headers for one activity" do
      subject.deposit("10/01/2012", 1000)
      expect(subject.print_statement).to eq "date || credit || debit || balance\n10/01/2012 || 1000 || || 1000"
    end
    it "prints statement with headers for two deposits" do
      subject.deposit("10/01/2012", 1000)
      subject.deposit("13/01/2012", 2000)
      expect(subject.print_statement).to eq "date || credit || debit || balance\n10/01/2012 || 1000 || || 1000\n13/01/2012 || 2000 || || 3000"
    end
  end

end
