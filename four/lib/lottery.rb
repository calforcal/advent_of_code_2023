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
end