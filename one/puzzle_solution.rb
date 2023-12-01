def calibration(file)
  sum = 0
  File.readlines(file).each do |line|
    puts find_num(line)
    sum += find_num(line)
  end

  return sum
end

def find_num(string)
  num = ""
  first_hash = {}
  second_hash = {}
  nums = [["one", 1], ["two", 2], ["three", 3], ["four", 4], ["five", 5], ["six", 6], ["seven", 7], ["eight", 8], ["nine", 9]]

  nums.each do |word|
    if !string.index(word[0]).nil?
      first_hash[word[1]] = string.index(word[0])
    end
  end

  nums.each do |word|
    if !string.index(word[0]).nil?
      second_hash[word[1]] = string.rindex(word[0])
    end
  end

  first_word = first_hash.min_by do |key, value|
    value
  end

  last_word = second_hash.max_by do |key, value|
    value
  end

  first_num = []
  last_num = []

  string.chars.each_with_index do |char, index|
    if char == "0"
      first_num = [char, index]
      break
    elsif char.to_i != 0
      first_num = [char, index]
      break
    end
  end

  length = string.length - 1
  string.reverse.chars.each_with_index do |char, index|
    index = length - index
    if char == "0"
      last_num = [char, index]
      break
    elsif char.to_i != 0
      last_num = [char, index]
      break
    end
  end

  first_num[1] = string.length if first_num[1].nil?
  last_num[1] = 0 if last_num[1].nil?

  if !first_word.nil? && first_word.any?
    first_word[1] < first_num[1] ? num += first_word[0].to_s : num += first_num[0]
  else
    num += first_num[0]
  end

  if !last_word.nil? && last_word.any?
    last_word[1] > last_num[1] ? num += last_word[0].to_s : num += last_num[0]
  else
    num += last_num[0]
  end

  return num.to_i
end

puts calibration('./one/data_one.txt')