class RaceDay
  attr_reader :lines
  def initialize(file)
    @lines = File.readlines(file).map do |line|
      line.chomp!
    end
  end

  def races
    race_map = {}
    times = @lines[0].scan(/\d+/)
    distances = @lines[1].scan(/\d+/)
    times.each_with_index { |time, index| race_map[time.to_i] = distances[index].to_i }
    race_map
  end

  def beats_record?(hold_time, race_time, record)
    distance = hold_time * (race_time - hold_time)
    distance > record
  end

  def ways_to_beat_record(race_time, record)
    i = race_time / 2
    j = i + 1
    count = 0

    while i > 0
      if beats_record?(i, race_time, record)
        count += 1
        i -= 1
      else
        break
      end
    end

    while j < race_time
      if beats_record?(j, race_time, record)
        count += 1
        j += 1
      else
        break
      end
    end

    count
  end

  def product_of_record_beaters
    product = 1
    sum_of_records = races.map { |race_time, record| ways_to_beat_record(race_time, record) }
    sum_of_records.each { |race| product *= race }
    product
  end
end