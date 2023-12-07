class Game
  attr_reader :hands

  def initialize(file)
    @hands = File.readlines(file).map { |line| Hand.new(line.chomp!) }
  end

  def sort_hands
    sorted = { five_of_a_kind: [], four_of_a_kind: [], full_house: [], three_of_a_kind: [], two_pair: [], one_pair: [], high_card: [] }
    @hands.each do |hand|
      sorted[hand.hand_type] << hand
    end
    sorted
  end

  def sort_groups
    all_hands = []
    sort_hands.each do |group, hands|
      all_hands << hands.sort_by { |hand| [hand.cards[0], hand.cards[1], hand.cards[2], hand.cards[3], hand.cards[4]] }.reverse
    end
    all_hands.flatten
  end

  def sum_rank_and_bet
    sum = 0
    sort_groups.each_with_index { |hand, index| sum += ((sort_groups.length - index) * hand.bet) }
    sum
  end
end