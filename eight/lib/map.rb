class Map
  attr_reader :lines
  def initialize(file)
    @lines = File.readlines(file).map { |line| line.chomp! }
  end

  def directions
    @lines[0]
  end

  def guide
    map = {}
    @lines[2, @lines.length-1].each do |line|
      key_values = line.scan(/\w{3,3}/)
      map[key_values[0]] = [key_values[1], key_values[2]]
    end
    map
  end

  def navigate
    count = 0
    point = "AAA"
    result = "AAA"
    until result.is_a?(Integer)
      result = loop_directions(result)
      if result.is_a?(Integer)
        count += result
      else
        count += directions.length
      end
    end
    count
  end

  def loop_directions(point)
    directions.chars.each_with_index do |char, index|
      if char == "L"
        point = guide[point][0]
      elsif char == "R"
        point = guide[point][1]
      end

      return index + 1 if point == "ZZZ"
    end

    return point
  end

  def multi_path_navigation
    guide = self.guide
    count = 0
    result = get_starting_points
    i = 0

    until result == true
      count += 1
      result = step_and_check(directions[i], result, guide)
      if i >= directions.length - 1 then i = 0 else i += 1 end
    end
    count
  end

  def step_and_check(direction, points, guide)
    all_z = true
    new_points = points.map do |point|
      if direction == "L"
        point = guide[point][0]
        all_z = false if point[-1] != "Z"
      elsif direction == "R"
        point = guide[point][1]
        all_z = false if point[-1] != "Z"
      end
      point
    end
    all_z ? all_z : new_points
  end

  def get_starting_points
    guide.keys.select { |key| key[-1] == "A" }
  end
end