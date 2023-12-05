class Card
  attr_reader :card, 
              :get_card_heading, 
              :winning_nums, 
              :game_nums, 
              :points_for_card, 
              :matches_for_card
              
  def initialize(data)
    @data = data
    @card = get_card_heading
    @winning_nums = winning_nums
    @game_nums = game_nums
    @points_for_card = points_for_card
    @matches_for_card = matches_for_card
  end

  def split_card
    @data.split(": ")
  end

  def get_card_heading
    card = split_card
    split_card[0]
  end

  def split_nums
    split_card[1].split("|")
  end

  def winning_nums
    winners = split_nums[0].split(" ")
    winners.map { |num| num.to_i }
  end

  def game_nums
    nums = split_nums[1].split(" ")
    nums.map { |num| num.to_i }
  end

  def points_for_card
    total = 0
    game_nums.each do |num|
      if winning_nums.include?(num) && total == 0
        total += 1
      elsif winning_nums.include?(num) && total > 0
        total *= 2
      end
    end
    total
  end

  def matches_for_card
    game_nums.count { |num| winning_nums.include?(num) }
  end
end