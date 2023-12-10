require "./three/lib/engine.rb"
require "./four/lib/card.rb"
require "./four/lib/lottery.rb"
require "./five/lib/farm.rb"
require "./six/lib/race_day.rb"
require "./seven/lib/game.rb"
require "./seven/lib/hand.rb"
require "./eight/lib/map.rb"
require "./nine/lib/report.rb"
require 'pry'

puts ""
puts "----------DAY 3 SOLUTIONS----------"

puts ""
puts "{PART ONE}"
puts ""
engine = Engine.new("./three/data/data.txt")
puts "Sum of Valid Parts: #{engine.sum_valid_parts}"
puts ""
puts "{PART TWO}"
puts ""
puts "Sum of Star Parts: #{engine.sum_star_products}"
puts ""
# p engine.star_parts


puts ""
puts "----------DAY 4 SOLUTIONS----------"
lottery = Lottery.new("./four/fixtures/data.txt")
# lottery = Lottery.new("./four/fixtures/half_data.txt")
# p lottery.cards
puts ""
puts "{PART ONE}"
puts ""
puts "Total Cards Instances: #{lottery.total_points_in_deck}"

#lottery.total_cards_instances


# bonus_map = {}
# lottery.cards.each_with_index do |card, index|
#   bonus_map[index] = card.matches_for_card
# end

# p lottery.card_plus_bonus(1, bonus_map)

puts ""
puts "----------DAY 5 SOLUTIONS----------"
puts ""
farm = Farm.new("./five/data/data.txt")
puts "{PART ONE}"
puts ""
puts "Minimum Distance for Seed-To-Location: #{farm.minimum_distance}"
# p farm.range_minimum_distance

# p farm.extract_seeds_info.length
# p farm.get_seeds_range.length

# p farm.find_minimum_conversion

# farm.seed_to_location(172346126)
puts ""
puts "----------DAY 6 SOLUTIONS----------"
puts ""
race_day = RaceDay.new("./six/data/data.txt")
puts "{PART ONE}"
puts ""
puts "Product of Ways to Beat the Record (in each race): #{race_day.product_of_record_beaters}"
puts ""
real_data = race_day.the_race
time = real_data.keys.first
record = real_data.values.first
puts "PART TWO"
puts ""
puts "Ways to beat THE RACE record: #{race_day.ways_to_beat_record(time, record)}"

puts ""
puts "----------DAY 7 SOLUTIONS----------"
puts ""
game = Game.new("./seven/data/data.txt")
puts "{PART ONE}"
puts ""
puts "Sum of Hands: 248836197"
puts ""
puts "PART TWO"
puts ""
puts "Sum of Hands: #{game.sum_rank_and_bet}"
puts ""

puts ""
puts "----------DAY 8 SOLUTIONS----------"
puts ""
map = Map.new("./eight/data/data.txt")
puts "{PART ONE}"
puts ""
puts "Steps to ZZZ: #{map.navigate}"
puts ""
puts "PART TWO"
puts ""
# puts "Simultaneous Steps to Z Nodes: #{map.multi_path_navigation}"
puts ""

puts ""
puts "----------DAY 9 SOLUTIONS----------"
puts ""
report = Report.new("./nine/data/data.txt")
puts "{PART ONE}"
puts ""
puts "Sum of Next in Sequence: #{report.sum_all_sequences}"
puts ""
puts "PART TWO"
puts ""
puts "Sum of Reverse Next in Sequence: #{report.reverse_sum_all_sequences}"