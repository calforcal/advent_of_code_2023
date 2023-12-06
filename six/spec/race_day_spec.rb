require "./lib/race_day.rb"

RSpec.describe RaceDay do
  let!(:file) { "./data/test_data.txt" }
  let!(:race_day) { RaceDay.new(file) }

  describe "#initialize" do
    it "initializes with a file" do
      expect(race_day).to be_an_instance_of RaceDay
      expect(race_day.lines).to be_an Array
    end
  end

  describe "#races" do
    it "can return the races as a hash" do
      expect(race_day.races).to be_a Hash
      expect(race_day.races.keys).to eq([7, 15, 30])
      expect(race_day.races.values).to eq([9, 40, 200])
    end
  end

  describe "#beats_record?" do
    it "can calculate if a given strategy beats the record" do
      expect(race_day.beats_record?(1, 7, 9)).to be(false)
      expect(race_day.beats_record?(3, 7, 9)).to be(true)
    end
  end

  describe "#ways_to_beat_record" do
    it "can determine the number of ways to break the record for a give race" do
      expect(race_day.ways_to_beat_record(7, 9)).to eq(4)
      expect(race_day.ways_to_beat_record(15, 40)).to eq(8)
    end
  end

  describe "#product_of_record_beaters" do
    it "can return the product of all the different ways to beat a races record" do
      expect(race_day.product_of_record_beaters).to eq(288)
    end
  end
end