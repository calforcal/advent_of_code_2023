require './lib/lottery.rb'

RSpec.describe Lottery do
  let!(:file) { "./fixtures/test_data.txt" }
  let!(:lottery) {Lottery.new(file) }
  describe "#initialize" do
    it "initializes with a file" do
      expect(lottery).to be_an_instance_of(Lottery)
      expect(lottery.cards).to be_an(Array)
      expect(lottery.cards.first).to be_an_instance_of(Card)
    end
  end
end