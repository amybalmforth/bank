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
      subject.withdraw(500)
      expect(subject.balance).to eq -500
    end
    it "withdraws 1000 pounds" do
      subject.withdraw(1000)
      expect(subject.balance).to eq -1000
    end
  end

  describe "statement" do
    it "displays statement with empty account and no activity" do
      expect(subject.statement).to eq ""
    end
    it "displays statement after deposit of 1000 pounds" do
      subject.deposit("10/01/2012", 1000)
      expect(subject.statement).to eq "Date: 10/01/2012 Credit: 1000"
    end
  end

end
