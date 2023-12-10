class Engine
  attr_reader :components
  def initialize(file)
    @components = File.readlines(file).map do |line|
      line.chomp!
    end
  end

  def locate_all_numbers
    @components.map do |line|
      line.enum_for(:scan, /\d{1,3}/).map { [Regexp.last_match.begin(0), Regexp.last_match.to_s.length] }
    end
  end

  def valid_part?(i, j_arr)
    if j_arr[1] == 3
      length_3.each do |coord|
        next if @components[i + coord[0]].nil? || @components[i + coord[0]][j_arr[0] + coord[1]].nil?
        return true if /[$&+,:;=?@#|\/'<>^*()%!-]/.match?(@components[i + coord[0]][j_arr[0] + coord[1]])
      end
    elsif j_arr[1] == 2
      length_2.each do |coord|
        next if @components[i + coord[0]].nil? || @components[i + coord[0]][j_arr[0] + coord[1]].nil?
        return true if /[$&+,:;=?@#|\/'<>^*()%!-]/.match?(@components[i + coord[0]][j_arr[0] + coord[1]])
      end
    elsif j_arr[1] == 1
      length_1.each do |coord|
        next if @components[i + coord[0]].nil? || @components[i + coord[0]][j_arr[0] + coord[1]].nil?
        return true if /[$&+,:;=?@#|\/'<>^*()%!-]/.match?(@components[i + coord[0]][j_arr[0] + coord[1]])
      end
    end
    false
  end

  def valid_parts
    parts = []
    locate_all_numbers.each_with_index do |line, index|
      line.each do |arr|
        valid_part?(index, arr) ? parts << @components[index][arr[0], arr[1]].to_i : nil
      end
    end
    parts
  end

  def sum_valid_parts
    valid_parts.sum { |part| part }
  end

  def length_3
    [[-1, -1], [-1, 0], [-1, 1], [-1, 2], [-1, 3], [0, 3], [1, 3], [1, 2], [1, 1], [1, 0], [1, -1], [0, -1]]
  end

  def length_2
    [[-1, -1], [-1, 0], [-1, 1], [-1, 2], [0, 2], [1, 2], [1, 1], [1, 0], [1, -1], [0, -1]]
  end

  def length_1
    [[-1, -1], [-1, 0], [-1, 1], [0, 1], [1, 1], [1, 0], [1, -1], [0, -1]]
  end

  def star_parts
    stars = []
    @components.each_with_index do |line, i|
      line.chars.each_with_index do |char, j|
        if char == "*"
          stars << star_biopsy(i, j)
        end
      end
    end
    stars.select { |arr| arr.length > 1 }
  end

  def sum_star_products
    star_parts.sum { |arr| arr[0] * arr[1] }
  end

  def touching_star?(line, j)
    nums = []
    line.enum_for(:scan, /\d{1,3}/).each do |char|
      begin_index = Regexp.last_match.begin(0) - 1 < 0 ? 0 : Regexp.last_match.begin(0) - 1
      end_index = begin_index + Regexp.last_match.to_s.length
      if j >= begin_index && j <= end_index
        nums.append(char.to_i)
      end
    end
    nums
  end

  def star_biopsy(i, j)
    collector = []
    top = @components[i - 1][j - 3, j + 3]
    middle = @components[i][j - 3, j + 3]
    bottom = @components[i + 1][j - 3, j + 3]

    collector << touching_star?(top, j)
    collector << touching_star?(middle, j)
    collector << touching_star?(bottom, j)

    collector.flatten!
  end
end