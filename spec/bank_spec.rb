require "bank"

describe Bank do

  describe "balance" do

    it "start with a balance of 0" do
      expect(subject.balance).to eq 0
    end

  end

end
