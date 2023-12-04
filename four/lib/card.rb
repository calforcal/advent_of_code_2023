class Card
  attr_reader :card
  def initialize(data)
    @data = data
    @card = get_card_heading
  end

  def split_card
    @data.split(": ")
  end

  def get_card_heading
    card = split_card
    split_card[0]
  end

  def split_nums
    all_nums = split_card[1].split("|")
  end

  def winning_nums
    winners = split_nums[0].split(" ")
    winners.map { |num| num.to_i }
  end

  def game_nums
    nums = split_nums[1].split(" ")
    nums.map { |num| num.to_i }
  end
end