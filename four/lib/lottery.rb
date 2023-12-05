class Lottery
  attr_accessor :cards
  def initialize(file)
    @lines = File.readlines(file) do |line|
      line.chomp!
    end
  end

  def cards
    @lines.map { |line| Card.new(line) }
  end

  def total_points_in_deck
    cards.sum { |card| card.points_for_card }
  end

  def total_cards_instances
    all_cards = cards
    bonus_map = {}
    i = 0

    while i < all_cards.length
      bonus_map[i] = i
      i += 1
    end

    j = 0

    card_plus_bonus(1, bonus_map)

    # instance_map = {}

    # while j < all_cards.length
    #   instance_map[j] = card_plus_bonus(j, bonus_map)
    #   j += 1
    # end

    # instance_map[1]

    # i = 0
    # total = 0
    # while i < cards.length
    #   total += card_plus_bonus(i, bonus_map)
    #   i += 1
    # end
    # total
  end

  def card_plus_bonus(i, bonus_map)
    card_matches = bonus_map[i]
    total = 1 + card_matches
    j = i+1
    arr = (j..(i+card_matches)).to_a

    while arr.any?
      arr.flatten!
      if bonus_map[arr.first] != nil
        bonus_map[arr.first] > 0 ? total += bonus_map[arr.first] : nil
        arr << ((arr.first + 1)..(arr.first + bonus_map[arr[0]])).to_a
        arr.shift
      else
        arr.shift
      end
      arr.flatten!
    end

    total
  end
end

# bonus_map = hash
# total_map = hash

# Map through all_cards, turning each one into a hash, with its points total, and another hash with just = 0
      # { card_num (int): card.points }
      # { card_num (int): 0 }

# RECURSION BEGIN

# Establish a function that takes parameter i, total_map, bonus_map
  # return total_map if i > cards.length
  # it gives total_map[i] += 1
  # card_points for card[i]
  # [range of i to i+card_points].each do |element|
    # do the method again 

  # Call method with i + 1

# 2:
# 3:
# 4: 
# 5:

# total: 15