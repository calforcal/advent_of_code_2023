require './lib/lottery.rb'

RSpec.describe Lottery do
  let!(:file) { "./fixtures/test_data.txt" }
  let!(:real) { "./fixtures/data.txt" }
  let!(:lottery) {Lottery.new(file) }
  describe "#initialize" do
    it "initializes with a file" do
      expect(lottery).to be_an_instance_of(Lottery)
      expect(lottery.cards).to be_an(Array)
      expect(lottery.cards.first).to be_an_instance_of(Card)
    end
  end

  describe "#total_points_in_deck" do
    it "can calculate the total points for all cards" do
      expect(lottery.total_points_in_deck).to eq(13)
    end
  end

  describe "#total_points_with_bonus_copies" do
    it "should calculate all the instances of the cards, with bonus copies, etc.." do
      expect(lottery.total_cards_instances).to eq(30)
    end
  end

  describe "#card_plus_bonus" do
    it "will get the instances of one card path" do
      bonus_map = {}
      lottery.cards.each_with_index do |card, index|
        bonus_map[index] = card.matches_for_card
      end

      expect(lottery.card_plus_bonus(0, bonus_map)).to eq(15)
    end
  end
end