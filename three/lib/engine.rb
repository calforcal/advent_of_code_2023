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
      length_3.each do |coord|
        next if @components[i + coord[0]].nil? || @components[i + coord[0]][j_arr[0] + coord[1]].nil?
        return true if /[$&+,:;=?@#|\/'<>^*()%!-]/.match?(@components[i + coord[0]][j_arr[0] + coord[1]])
      end
    elsif j_arr[1] == 1
      length_3.each do |coord|
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
end