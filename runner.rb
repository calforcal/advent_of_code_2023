require "./four/lib/card.rb"
require "./four/lib/lottery.rb"
require "./five/lib/farm.rb"
require 'pry'

# lottery = Lottery.new("./four/fixtures/data.txt")
# lottery = Lottery.new("./four/fixtures/half_data.txt")
# p lottery.total_points_in_deck
# p lottery.cards

# p lottery.total_cards_instances


# bonus_map = {}
# lottery.cards.each_with_index do |card, index|
#   bonus_map[index] = card.matches_for_card
# end

# p lottery.card_plus_bonus(1, bonus_map)

farm = Farm.new("./five/data/data.txt")
puts farm.minimum_distance
# p farm.range_minimum_distance

# p farm.extract_seeds_info.length
# p farm.get_seeds_range.length

# p farm.find_minimum_conversion

# farm.seed_to_location(172346126)