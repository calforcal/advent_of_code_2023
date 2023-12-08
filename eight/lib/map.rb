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
end