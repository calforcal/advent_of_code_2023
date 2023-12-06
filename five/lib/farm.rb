require 'pry'
class Farm
  def initialize(file)
    @lines = File.readlines(file).map do |line|
      line.chomp!
    end
  end

  def all_info
    i = 0
    info = {}
    while i < @lines.length
      if i == 0
        info[:seeds] = extract_seeds_info
        i += 1
      elsif @lines[i] == "seed-to-soil map:"
        i += 1
        info[:seed_to_soil] = []
        while /\d/.match?(@lines[i][-1])
          info[:seed_to_soil] << extract_info(@lines[i])
          i += 1
        end
      elsif @lines[i] == "soil-to-fertilizer map:"
        i += 1
        info[:soil_to_fertilizer] = []
        while /\d/.match?(@lines[i][-1])
          info[:soil_to_fertilizer] << extract_info(@lines[i])
          i += 1
        end
      elsif @lines[i] == "fertilizer-to-water map:"
        i += 1
        info[:fertilizer_to_water] = []
        while /\d/.match?(@lines[i][-1])
          info[:fertilizer_to_water] << extract_info(@lines[i])
          i += 1
        end
      elsif @lines[i] == "water-to-light map:"
        i += 1
        info[:water_to_light] = []
        while /\d/.match?(@lines[i][-1])
          info[:water_to_light] << extract_info(@lines[i])
          i += 1
        end
      elsif @lines[i] == "light-to-temperature map:"
        i += 1
        info[:light_to_temperature] = []
        while /\d/.match?(@lines[i][-1])
          info[:light_to_temperature] << extract_info(@lines[i])
          i += 1
        end
      elsif @lines[i] == "temperature-to-humidity map:"
        i += 1
        info[:temperature_to_humidity] = []
        while /\d/.match?(@lines[i][-1])
          info[:temperature_to_humidity] << extract_info(@lines[i])
          i += 1
        end
      elsif @lines[i] == "humidity-to-location map:"
        i += 1
        info[:humidity_to_location] = []
        while @lines[i] != nil && /\d/.match?(@lines[i][-1])
          info[:humidity_to_location] << extract_info(@lines[i])
          i += 1
        end
      end
      i += 1
    end
    info
  end

  def extract_seeds_info
    split_nums = @lines[0].split(" ")
    nums = split_nums.map { |num| num.to_i }
    nums.drop(1)
  end



  def get_seeds_range
    seeds = extract_seeds_info
    range_seeds = []
    i = 0
    j = 1

    while j < seeds.length
      range = (seeds[i]...(seeds[i] + seeds[j])).to_a
      range_seeds << range
      i += 2
      j += 2
    end
    range_seeds.flatten
  end

  def get_seeds_no_range
    seeds = extract_seeds_info
    i = 0
    no_range = []
    while i < seeds.length
      no_range << seeds[i]
      i += 2
    end
    no_range
  end

  def extract_info(line)
    info = line.split(" ")
    {
      source: info[1].to_i,
      destination: info[0].to_i,
      range: info[2].to_i
    }
  end

  def chart_map(chart)
    info = all_info
    info[chart]
  end

  def conversion(seed, chart_type)
    chart_map(chart_type).each do |chart|
      if seed >= chart[:source] && seed <= (chart[:source] + chart[:range] - 1)
        return seed + (chart[:destination] - chart[:source])
      end
    end
    seed
  end

  def seed_to_location(seed)
    soil = conversion(seed, :seed_to_soil)
    fertilizer = conversion(soil, :soil_to_fertilizer)
    water = conversion(fertilizer, :fertilizer_to_water)
    light = conversion(water, :water_to_light)
    temperature = conversion(light, :light_to_temperature)
    humidity = conversion(temperature, :temperature_to_humidity)
    location = conversion(humidity, :humidity_to_location)
  end

  def minimum_distance
    seeds = extract_seeds_info
    seeds.map do |seed|
      seed_to_location(seed)
    end.min
  end

  # def minimum_distance
  #   all_seeds = extract_seeds_info
  #   seed = range_minimum_distance
  #   range_index = all_seeds.index(seed[0]) + 1

  #   seeds = (seed[0]...all_seeds[range_index]).to_a

  #   min_distance = {}
  #   seeds.map do |seed|
  #     seed_to_location(seed)
  #   end.min
  # end

  def range_minimum_distance
    seeds = get_seeds_no_range
    min_distance = {}
    seeds.each do |seed|
      min_distance[seed] = seed_to_location(seed)
    end
    min_distance.min_by { |k,v| v}
  end

  def find_minimum_conversion
    chart_map(:seed_to_soil).min_by do |hash|
      hash[:destination] + hash[:range]
    end
  end
end