require "./lib/hand.rb"

RSpec.describe Hand do
  let!(:hand) { Hand.new("32T3K 765")}

  describe "initialize" do
    it "initializes" do
      expect(hand).to be_an_instance_of Hand
    end

    it "initializes with attributes" do
      expect(hand.cards).to be_an Array
      expect(hand.cards).to eq([3, 2, 10, 3, 13])

      expect(hand.bet).to be_an Integer
      expect(hand.bet).to eq(765)
    end
  end

  describe "#hand_type" do
    it "can determine the hand_type based on a hands cards" do
      expect(hand.hand_type).to eq(:one_pair)
    end
  end
end