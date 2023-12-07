require "./lib/engine.rb"

RSpec.describe Engine do
  let!(:file) { './data/test_data.txt' }
  let!(:engine) { Engine.new(file) }

  describe "#initialize" do
    it "initializes with a file" do
      expect(engine).to be_an_instance_of Engine
      expect(engine.components).to be_an Array
    end
  end

  describe "#locate_all_numbers" do
    it "can locate all the part numbers indexes and number length" do
      expect(engine.locate_all_numbers).to eq([[[0, 3], [5, 3]], [], [[2, 2], [6, 3]], [], [[0, 3]], [[7, 2]], [[2, 3]], [[6, 3]], [], [[1, 3], [5, 3]]])
    end
  end

  describe "#valid_part?" do
    it "will return a boolean based on if there is an adjacent symbol to the given nnumber" do
      expect(engine.valid_part?(0, [0, 3])).to be(true)
      expect(engine.valid_part?(0, [5, 3])).to be(false)
    end
  end

  describe "#valid_parts" do
    it "will return all parts that were determined to be valid" do
      expect(engine.valid_parts).to eq([467, 35, 633, 617, 592, 755, 664, 598])
    end
  end

  describe "#sum_valid_parts" do
    it "can sum all of the valid part that are found" do
      expect(engine.sum_valid_parts).to eq(4361)
    end
  end
end