require "./lib/report.rb"

RSpec.describe Report do
  let!(:file) { "./data/test_data.txt" }
  let!(:report) { Report.new(file) }

  describe "#initialize" do
    it "initializes with a file" do
      expect(report).to be_an_instance_of Report
      expect(report.documents).to be_an Array
    end
  end

  describe "#next_in_sequence" do
    it "can find the next number in a given sequence" do
      expect(report.next_in_sequence([0, 3, 6, 9, 12, 15])).to eq(18)
    end
  end

  describe "#sum_all_sequences" do
    it "can sum all sequential numbers found" do
      expect(report.sum_all_sequences).to eq(114)
    end
  end

  describe "#reverse_next_in_sequence" do
    it "can find the next first number in a given sequence" do
      expect(report.reverse_next_in_sequence([0, 3, 6, 9, 12, 15])).to eq(-3)
      expect(report.reverse_next_in_sequence([1, 3, 6, 10, 15, 21])).to eq(0)
      expect(report.reverse_next_in_sequence([10, 13, 16, 21, 30, 45])).to eq(5)
    end
  end

  describe "#reverse_sum_all_sequences" do
    it "can sum all of the reverse sequential numbers found" do
      expect(report.reverse_sum_all_sequences).to eq(2)
    end
  end
end