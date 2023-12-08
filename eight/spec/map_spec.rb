require "./lib/map.rb"

RSpec.describe Map do
  let!(:file) { "./data/test_data.txt" }
  let!(:map) { Map.new(file) }

  describe "#initialize" do
    it "can initialize with a file" do
      expect(map).to be_an_instance_of Map
    end
  end

  describe "#directions" do
    it "can return a string of the LR directions" do
      expect(map.directions).to be_a String
      expect(map.directions).to eq("LLR")
    end
  end

  describe "#guide" do
    it "should return a Hash of the map key/guide" do
      expect(map.guide).to be_a Hash
      expect(map.guide).to eq({ "AAA" =>  ["BBB", "BBB"], "BBB" => ["AAA", "ZZZ"], "ZZZ" => ["ZZZ", "ZZZ"] })
    end
  end

  describe "#navigate" do
    it "can count how many steps it takes to navigate from AAA to ZZZ" do
      expect(map.navigate).to eq(6)
    end
  end
end