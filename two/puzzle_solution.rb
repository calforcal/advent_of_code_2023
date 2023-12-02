class CubeGame
  def initialize(file)
    @games = File.readlines(file)
  end

  def valid_games
    valid = []
    @games.each do |game|
      separate_heading = game.split(": ")
      heading = separate_heading[0].split(" ")
      game_num = heading[1].to_i

      rounds = separate_heading[1].split("; ")

      good = true
      rounds.each do |round|
        min_red = 0
        min_green = 0
        min_blue = 0
        scores = round.split(", ")
        scores.each do |score|
          color_pairs = score.split(" ")
          if color_pairs[1] == "red" && color_pairs[0].to_i > 12
            good = false
          elsif color_pairs[1] == "green" && color_pairs[0].to_i > 13
            good = false
          elsif color_pairs[1] == "blue" && color_pairs[0].to_i > 14
            good = false
          end
        end
      end
      good ? valid << game_num : nil
    end

    valid.sum { |score| score }
  end
end

game = CubeGame.new('./two/game_data.txt')
p game.valid_games