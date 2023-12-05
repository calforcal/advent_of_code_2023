require './lib/card.rb'

RSpec.describe Card do
  let!(:file) { "./fixtures/test_data.txt" }
  let!(:lottery) {Lottery.new(file) }
  let!(:data) { "Card 1: 41 48 83 86 17 | 83 86  6 31 17  9 48 53" }
  let!(:card) { Card.new(data) }
  let!(:card_2) { Card.new("Card 2: 13 32 20 16 61 | 61 30 68 82 17 32 24 19") }

  describe "#initialize" do
    it "initializes with data" do
      expect(card).to be_an_instance_of(Card)
      expect(card.card).to eq("Card 1")
      expect(card.winning_nums).to eq([41, 48, 83, 86, 17])
      expect(card.game_nums).to eq([83, 86, 6, 31, 17, 9, 48, 53])
    end
  end

  describe "#points_for_card" do
    it "can calculate the points total for one card" do
      expect(card.points_for_card).to eq(8)
      expect(card_2.points_for_card).to eq(2)
    end
  end

  describe "#matches_for_card" do
    it "can calculate the matches for one card" do
      expect(card.matches_for_card).to eq(4)
      expect(card_2.matches_for_card).to eq(2)
    end
  end
end