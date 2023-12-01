def calibration(file)
  sum = 0
  File.readlines(file).each do |line|
    sum += find_nums(line)
  end

  return sum
end

def find_nums(string)
  num = ""
  nums = [["one", 1], ["two", 2], ["three", 3], ["four", 4], ["five", 5], ["six", 6], ["seven", 7], ["eight", 8], ["nine", 9]]
  first_word = find_first_word(string, nums)
  last_word = find_last_word(string, nums)

  first_num = find_first_num(string)
  last_num = find_last_num(string)

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

def find_first_word(string, nums)
  hash = {}

  nums.each do |word|
    if !string.index(word[0]).nil?
      hash[word[1]] = string.index(word[0])
    end
  end

  hash.min_by do |key, value|
    value
  end
end

def find_last_word(string, nums)
  hash = {}

  nums.each do |word|
    if !string.index(word[0]).nil?
      hash[word[1]] = string.rindex(word[0])
    end
  end

  last_word = hash.max_by do |key, value|
    value
  end
end

def find_first_num(string)
  first_num = []

  string.chars.each_with_index do |char, index|
    if char == "0"
      first_num = [char, index]
      break
    elsif char.to_i != 0
      first_num = [char, index]
      break
    end
  end

  first_num
end

def find_last_num(string)
  last_num = []
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

  last_num
end

puts calibration('./one/data_one.txt')