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
      min_red = 0
      min_green = 0
      min_blue = 0

      rounds.each do |round|
        scores = round.split(", ")
        scores.each do |score|
          color_pairs = score.split(" ")
          if color_pairs[1] == "red"
            if min_red < color_pairs[0].to_i
              min_red = color_pairs[0].to_i
            end
          elsif color_pairs[1] == "green"
            if min_green < color_pairs[0].to_i
              min_green = color_pairs[0].to_i
            end
          elsif color_pairs[1] == "blue"
            if min_blue < color_pairs[0].to_i
              min_blue = color_pairs[0].to_i
            end
          end
        end
      end
      valid << {game: game_num, red: min_red, green: min_green, blue: min_blue}
    end

    # valid.sum { |score| score[:game] }
    valid.sum { |score| score[:red] * score[:green] * score[:blue]}
    # valid
  end
end

game = CubeGame.new('./two/game_data.txt')
p game.valid_games