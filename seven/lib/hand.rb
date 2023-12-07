class Hand
  attr_reader :bet, :cards
  def initialize(data)
    @data = data.split(" ")
    @cards = @data[0].split("").map {|char| convert_card(char)}
    @bet = @data[1].to_i
  end

  def cards_map
    cards_map = {}
    @cards.each do |card|
      if cards_map[card].nil?
         cards_map[card] = 1
      else
        cards_map[card] += 1
      end
    end
    cards_map
  end

  def convert_card(char)
    if char == "A"
      return 14
    elsif char == "K"
      return 13
    elsif char == "Q"
      return 12
    elsif char == "J"
      return 11
    elsif char == "T"
      return 10
    else
      return char.to_i
    end
  end

  def hand_type
    max = find_largest_pair[1]
    if max == 5
      return :five_of_a_kind
    elsif max == 4
      return :four_of_a_kind
    elsif max == 3 && cards_map.keys.length == 2
      return :full_house
    elsif max == 3
      return :three_of_a_kind
    elsif max == 2 && cards_map.keys.length == 3
      return :two_pair
    elsif max == 2
      return :one_pair
    else
      return :high_card
    end
  end

  def find_largest_pair
    max = cards_map.max_by { |card, num| num }
  end

  def highest_pair
    find_largest_pair[0]
  end

  def sort_cards
    cards_map.sort_by {|k,v| v}
  end
end