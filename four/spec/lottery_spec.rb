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
end