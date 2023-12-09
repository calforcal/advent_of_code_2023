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

  describe "PART 2 TESTING" do
    let!(:file) { "./data/test_data_two.txt" }
    let!(:map) { Map.new(file) }

    describe "#get_starting_points" do
      it "can get all starting nodes (ending in A)" do
        expect(map.get_starting_points).to eq(["11A", "22A"])
      end
    end

    describe "#step_and_check" do
      it "can take a list of points, and determine if their next step results in all Zs" do
        guide = map.guide
        expect(map.step_and_check("L", map.get_starting_points, guide)).to eq(["11B", "22B"])
        expect(map.step_and_check("R", ["11B", "22C"], guide)).to eq(true)
      end
    end

    describe "#multi_path_navigation" do
      it "can simultaneously navigate two paths to Z-Coordinates" do
        expect(map.multi_path_navigation).to eq(6)
      end
    end
  end
end