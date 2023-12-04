class Engine
  def initialize(file)
    @components = File.readlines(file).map do |line|
        line.chomp!
    end.compact
  end

  def sum_of_part_numbers
    valid_nums.sum { |num| num }
  end

  def find_all_nums
    nums = []
    @components.each do |line|
      x = line.scan(/[0-9]{1,3}/)
      nums << x.map { |e| e.include?(".") ? e.gsub!(".", "") : e }
    end
    nums
  end

  def valid_nums
    valid = []
    all_nums = find_all_nums

    all_nums.each_with_index do |row, i|
      row.each do |num|
        num_len = num.length

        j = @components[i].enum_for(:scan, /#{num}/).map do
          Regexp.last_match.offset(0).first
        end

        j.each do |e|
          valid << num.to_i if is_valid?(i, e, num_len)
        end

        if num_len == 3
          @components[i].gsub!(num, "...")
        elsif num_len == 2
          @components[i].gsub!(num, "..")
        elsif num_len == 1
          @components[i].gsub!(num, ".")
        end
      end
    end

    valid
  end

  def is_valid?(i, j, num_len)
    if num_len == 3
      length_3(i, j)
    elsif num_len == 2
      length_2(i, j)
    elsif num_len == 1
      length_1(i, j)
    end
  end

  def length_3(i, j)
    return true if (!@components[i-1][j-1].nil? && @components[i-1][j-1] != "." && !@components[i-1][j-1].match(/[0-9]/))
    return true if (!@components[i-1][j].nil? && @components[i-1][j] != "." && !@components[i-1][j].match(/[0-9]/))
    return true if (!@components[i-1][j+1].nil? && @components[i-1][j+1] != "." && !@components[i-1][j+1].match(/[0-9]/))
    return true if (!@components[i-1][j+2].nil? && @components[i-1][j+2] != "." && !@components[i-1][j+2].match(/[0-9]/))
    return true if (!@components[i-1][j+3].nil? && @components[i-1][j+3] != "." && !@components[i-1][j+3].match(/[0-9]/))
    return true if (!@components[i][j+3].nil? && @components[i][j+3] != "." && !@components[i][j+3].match(/[0-9]/))
    return true if (!@components[i][j-1].nil? && @components[i][j-1] != "." && !@components[i][j-1].match(/[0-9]/))
    return false if @components[i+1] == nil
    return true if (!@components[i+1][j+3].nil? && @components[i+1][j+3] != "." && !@components[i+1][j+3].match(/[0-9]/))
    return true if (!@components[i+1][j+2].nil? && @components[i+1][j+2] != "." && !@components[i+1][j+2].match(/[0-9]/))
    return true if (!@components[i+1][j+1].nil? && @components[i+1][j+1] != "." && !@components[i+1][j+1].match(/[0-9]/))
    return true if (!@components[i+1][j].nil? && @components[i+1][j] != "." && !@components[i+1][j].match(/[0-9]/))
    return true if (!@components[i+1][j-1].nil? && @components[i+1][j-1] != "." && !@components[i+1][j-1].match(/[0-9]/))

    false
  end

  def length_2(i, j)
    return true if (!@components[i-1][j-1].nil? && @components[i-1][j-1] != "." && !@components[i-1][j-1].match(/[0-9]/))
    return true if (!@components[i-1][j].nil? && @components[i-1][j] != "." && !@components[i-1][j].match(/[0-9]/))
    return true if (!@components[i-1][j+1].nil? && @components[i-1][j+1] != "." && !@components[i-1][j+1].match(/[0-9]/))
    return true if (!@components[i-1][j+2].nil? && @components[i-1][j+2] != "." && !@components[i-1][j+2].match(/[0-9]/))
    return true if (!@components[i][j+2].nil? && @components[i][j+2] != "." && !@components[i][j+2].match(/[0-9]/))
    return true if (!@components[i+1][j+2].nil? && @components[i+1][j+2] != "." && !@components[i+1][j+2].match(/[0-9]/))
    return true if (!@components[i+1][j+1].nil? && @components[i+1][j+1] != "." && !@components[i+1][j+1].match(/[0-9]/))
    return true if (!@components[i+1][j].nil? && @components[i+1][j] != "." && !@components[i+1][j].match(/[0-9]/))
    return true if (!@components[i+1][j-1].nil? && @components[i+1][j-1] != "." && !@components[i+1][j-1].match(/[0-9]/))
    return true if (!@components[i][j-1].nil? && @components[i][j-1] != "." && !@components[i][j-1].match(/[0-9]/))

    false
  end

  def length_1(i, j)
    return true if (!@components[i-1][j-1].nil? && @components[i-1][j-1] != "." && !@components[i-1][j-1].match(/[0-9]/))
    return true if (!@components[i-1][j].nil? && @components[i-1][j] != "." && !@components[i-1][j].match(/[0-9]/))
    return true if (!@components[i-1][j+1].nil? && @components[i-1][j+1] != "." && !@components[i-1][j+1].match(/[0-9]/))
    return true if (!@components[i][j+1].nil? && @components[i][j+1] != "." && !@components[i][j+1].match(/[0-9]/))
    return true if (!@components[i+1][j+1].nil? && @components[i+1][j+1] != "." && !@components[i+1][j+1].match(/[0-9]/))
    return true if (!@components[i+1][j].nil? && @components[i+1][j] != "." && !@components[i+1][j].match(/[0-9]/))
    return true if (!@components[i+1][j-1].nil? && @components[i+1][j-1] != "." && !@components[i+1][j-1].match(/[0-9]/))
    return true if (!@components[i][j-1].nil? && @components[i][j-1] != "." && !@components[i][j-1].match(/[0-9]/))

    false
  end

  def find_dupes
    z = find_all_nums
    z.map do |a|
      a.detect{ |e| a.count(e) > 1 }
    end
  end
end

engine = Engine.new("./three/data.txt")
# # engine = Engine.new("./three/test_data.txt")
# p engine.sum_of_part_numbers
# p engine.sum_of_part_numbers == 530849
p engine.valid_nums
# p engine.find_all_nums
# p engine.find_dupes.compact