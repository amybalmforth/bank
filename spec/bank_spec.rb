require 'bank'

describe Bank do

  describe "balance" do
    it "starts with a balance of 0" do
      expect(subject.balance).to eq 0
    end
  end

  describe "depositing" do
    it "deposits 1000 pounds" do
      subject.deposit(1000)
      expect(subject.balance).to eq 1000
    end
    it "deposits 2000 pounds" do
      subject.deposit(2000)
      expect(subject.balance).to eq 2000
    end
  end

  describe "withdrawing" do
    it "withdraws 500 pounds" do
      subject.withdraw(500)
      expect(subject.balance).to eq -500
    end
  end

end
