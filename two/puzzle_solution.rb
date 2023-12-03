class CubeGame
  def initialize(file)
    @games = File.readlines(file)
  end

  def valid_games
    valid = []
    @games.each do |game|
      game = split_game(game)
      game_num = game[:game_num]
      rounds = game[:rounds]

      valid_game?(rounds) ? valid << game_num : nil
    end

    valid.sum { |score| score }
  end

  def power_of_games
    games_stats = @games.map do |game|
      game = split_game(game)
      game_num = game[:game_num]
      rounds = game[:rounds]

      game_cubes_needed(rounds)
    end

    games_stats.sum { |stats| stats[:red] * stats[:green] * stats[:blue]}
  end

  def split_game(game)
    split_heading = game.split(": ")

    heading = split_heading[0].split(" ")
    game_num = heading[1].to_i
    rounds = split_heading[1].split("; ")
    return { game_num: game_num, rounds: rounds }
  end

  def valid_game?(rounds)
    rounds.each do |round|
      scores = round.split(", ")
      scores.each do |score|
        return false if !valid_score?(score)
      end
      true
    end
  end

  def valid_score?(score)
    color_pairs = score.split(" ")

    return false if color_pairs[1] == "red" && color_pairs[0].to_i > 12
    return false if color_pairs[1] == "green" && color_pairs[0].to_i > 13
    return false if color_pairs[1] == "blue" && color_pairs[0].to_i > 14

    true
  end

  def game_cubes_needed(rounds)
    game = {
      red: 1,
      green: 1,
      blue: 1
    }

    rounds.each do |round|
      scores = round.split(", ")
      scores.each do |score|
        color_pairs = score.split(" ")
        if color_pairs[1] == "red"
          game[:red] < color_pairs[0].to_i ? game[:red] = color_pairs[0].to_i : nil
        elsif color_pairs[1] == "green"
          game[:green] < color_pairs[0].to_i ? game[:green] = color_pairs[0].to_i : nil
        elsif color_pairs[1] == "blue"
          game[:blue] < color_pairs[0].to_i ? game[:blue] = color_pairs[0].to_i : nil
        end
      end
    end
    game
  end

  def determine_min_cubes(scores)
    game = {
      red: 1,
      green: 1,
      blue: 1
    }

    scores.each do |score|
      color_pairs = score.split(" ")
      if color_pairs[1] == "red"
        game[:red] < color_pairs[0].to_i ? game[:red] = color_pairs[0].to_i : nil
      elsif color_pairs[1] == "green"
        game[:green] < color_pairs[0].to_i ? game[:green] = color_pairs[0].to_i : nil
      elsif color_pairs[1] == "blue"
        game[:blue] < color_pairs[0].to_i ? game[:blue] = color_pairs[0].to_i : nil
      end
    end
    game
  end
end

game = CubeGame.new('./two/game_data.txt')
p game.power_of_games == 49710
p game.valid_games == 2683