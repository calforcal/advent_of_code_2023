class Report
  attr_reader :documents
  def initialize(file)
    @documents = File.readlines(file).map do |line|
      line.chomp!.split(" ").map { |char| char.to_i }
    end
  end

  def next_in_sequence(sequence)
    collector = [sequence]
    while collector[-1].uniq.length > 1
      differences = []
      i = 0
      j = 1
      while j < collector[-1].length
        differences << collector[-1][j] - collector[-1][i]
        i += 1
        j += 1
      end
      collector << differences
    end

    while collector.length > 1
      collector[-2] << (collector[-2][-1] + collector[-1][-1])
      collector.pop
    end

    collector.first[-1]
  end

  def reverse_next_in_sequence(sequence)
    collector = [sequence]
    while collector[-1].uniq.length > 1
      differences = []
      i = 0
      j = 1
      while j < collector[-1].length
        differences << collector[-1][j] - collector[-1][i]
        i += 1
        j += 1
      end
      collector << differences
    end

    while collector.length > 1
      collector[-2].prepend(collector[-2][0] - collector[-1][0])
      collector.pop
    end

    collector.first[0]
  end

  def sum_all_sequences
    @documents.sum { |document| next_in_sequence(document) }
  end

  def reverse_sum_all_sequences
    @documents.sum { |document| reverse_next_in_sequence(document) }
  end
end