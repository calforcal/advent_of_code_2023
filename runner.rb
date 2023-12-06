require "./four/lib/card.rb"
require "./four/lib/lottery.rb"
require "./five/lib/farm.rb"
require "./six/lib/race_day.rb"
require 'pry'

puts ""
puts "----------DAY 3 SOLUTIONS----------"

puts ""
puts "{PART ONE}"
puts ""
puts "Total"


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