require "./four/lib/card.rb"
require "./four/lib/lottery.rb"

lottery = Lottery.new("./four/fixtures/data.txt")
p lottery.total_points_in_deck
# p lottery.cards