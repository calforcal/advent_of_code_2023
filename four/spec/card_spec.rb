require './lib/card.rb'

RSpec.describe Card do
  let!(:file) { "./fixtures/test_data.txt" }
  let!(:lottery) {Lottery.new(file) }
  let!(:data) { "Card 1: 41 48 83 86 17 | 83 86  6 31 17  9 48 53" }
  let!(:card) { Card.new(data) }

  describe "#initialize" do
    it "initializes with data" do
      expect(card).to be_an_instance_of(Card)
      expect(card.card).to eq("Card 1")
      expect(card.winning_nums).to eq([41, 48, 83, 86, 17])
      expect(card.game_nums).to eq([83, 86, 6, 31, 17, 9, 48, 53])
    end
  end
end