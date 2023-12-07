require "./lib/game.rb"
require "./lib/hand.rb"

RSpec.describe Game do
  let!(:file) { "./data/test_data.txt" }
  let!(:game) { Game.new(file) }

  describe "#initialize" do
    it "can initialize with a file" do
      expect(game).to be_an_instance_of(Game)
    end

    it "initializes with an array of hands" do
      expect(game.hands).to be_an Array
      expect(game.hands.first).to be_a Hand
    end
  end

  # describe "#sort_hands" do
  #   it "can sort all of the hands in a Hash of arrays" do
  #     expect(game.sort_hands).to eq({
  #                                     five_of_a_kind: [],
  #                                     four_of_a_kind: [],
  #                                     full_house: [],
  #                                     three_of_a_kind: [game.hands[1], game.hands[4]],
  #                                     two_pair: [game.hands[2], game.hands[3]],
  #                                     one_pair: [game.hands[0]],
  #                                     high_card: []
  #                                   })
  #   end
  # end

  # describe "#sort_groups" do
  #   it "should be able to sort the hands based on their type and first card" do
  #     expect(game.sort_groups).to eq([game.hands[4], game.hands[1], game.hands[2], game.hands[3], game.hands[0]])
  #   end
  # end

  # describe "#sum_rank_and_bet" do
  #   it "can sum the product of rank and bet" do
  #     expect(game.sum_rank_and_bet).to eq(6440)
  #   end
  # end

  describe "#sort_hands" do
    it "can sort all of the hands in a Hash of arrays" do
      expect(game.sort_hands).to eq({
                                      five_of_a_kind: [],
                                      four_of_a_kind: [game.hands[1], game.hands[3], game.hands[4]],
                                      full_house: [],
                                      three_of_a_kind: [],
                                      two_pair: [game.hands[2]],
                                      one_pair: [game.hands[0]],
                                      high_card: []
                                    })
    end
  end

  describe "#sort_groups" do
    it "should be able to sort the hands based on their type and first card" do
      expect(game.sort_groups).to eq([game.hands[3], game.hands[4], game.hands[1], game.hands[2], game.hands[0]])
    end
  end

  describe "#sum_rank_and_bet" do
    it "can sum the product of rank and bet" do
      expect(game.sum_rank_and_bet).to eq(5905)
    end
  end
end