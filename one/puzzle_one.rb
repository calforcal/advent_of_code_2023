def calibration(file)
  sum = 0
  File.readlines(file).each do |line|
    sum += find_num(line)
  end

  return sum
end

def find_num(string)
  num = ""
  string.each_char do |char|
    if char == "0"
      num += char
      break
    elsif char.to_i != 0
      num += char
      break
    end
  end

  string.reverse.each_char do |char|
    if char == "0"
      num += char
      break
    elsif char.to_i != 0
      num += char
      break
    end
  end

  return num.to_i
end

puts calibration('./one/data_one.txt')