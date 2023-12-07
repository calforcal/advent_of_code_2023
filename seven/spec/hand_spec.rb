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

  describe "#update_joker_values" do
    line = "KTJJT 220"
    hand = Hand.new(line)

    it "can update the cards to adjust for a joker value" do
      expect(hand.pre_joker_hand_type).to eq(:one_pair)
      expect(hand.cards).to eq([13, 10, 0, 0, 10])
      expect(hand.hand_type).to eq(:four_of_a_kind)
      expect(hand.joker_cards).to eq([13, 10, 10, 10, 10])
    end
  end

  describe "initialize" do
    hand = Hand.new("T9999 305")
    it "initializes" do
      expect(hand).to be_an_instance_of Hand
    end

    it "initializes with attributes" do
      expect(hand.cards).to be_an Array
      expect(hand.cards).to eq([10, 9, 9, 9, 9])

      expect(hand.bet).to be_an Integer
      expect(hand.bet).to eq(305)
    end
  end

  describe "#hand_type" do
    it "can determine the hand_type based on a hands cards" do
      hand = Hand.new("T9999 305")
      expect(hand.pre_joker_hand_type).to eq(:four_of_a_kind)
      expect(hand.hand_type).to eq(:four_of_a_kind)
    end
  end
end