require "./lib/farm.rb"

RSpec.describe Farm do

  let!(:file) { "./data/test_data.txt" }
  let!(:farm) { Farm.new(file) }

  describe "#initialize" do
    it "can initialize with a file" do
      expect(farm).to be_an_instance_of(Farm)
    end
  end

  describe "#extract_seeds_info" do
    it "can extract the seeds info from the file lines" do
      expect(farm.extract_seeds_info).to eq([79, 14, 55, 13])
    end
  end

  describe "#extract_info" do
    it "can extract just the seed_to_soil information" do
      expect(farm.extract_info("50 98 2")).to eq({ source: 98, destination: 50, range: 2 })
    end
  end

  describe "#chart_map" do
    it "can get info for seed_to_soil" do
      expect(farm.chart_map(:seed_to_soil).first).to be_a(Hash)
      expect(farm.chart_map(:seed_to_soil).first[:source]).to eq(98)
      expect(farm.chart_map(:seed_to_soil).first[:destination]).to eq(50)
      expect(farm.chart_map(:seed_to_soil).first[:range]).to eq(2)
    end

    it "can get info for soil_to_fertilizer" do
      expect(farm.chart_map(:soil_to_fertilizer).first).to be_a(Hash)
      expect(farm.chart_map(:soil_to_fertilizer).first[:source]).to eq(15)
      expect(farm.chart_map(:soil_to_fertilizer).first[:destination]).to eq(0)
      expect(farm.chart_map(:soil_to_fertilizer).first[:range]).to eq(37)
    end

    it "can get info for fertilizer_to_water" do
      expect(farm.chart_map(:fertilizer_to_water).first).to be_a(Hash)
      expect(farm.chart_map(:fertilizer_to_water).first[:source]).to eq(53)
      expect(farm.chart_map(:fertilizer_to_water).first[:destination]).to eq(49)
      expect(farm.chart_map(:fertilizer_to_water).first[:range]).to eq(8)
    end

    it "can get info for water_to_light" do
      expect(farm.chart_map(:water_to_light).first).to be_a(Hash)
      expect(farm.chart_map(:water_to_light).first[:source]).to eq(18)
      expect(farm.chart_map(:water_to_light).first[:destination]).to eq(88)
      expect(farm.chart_map(:water_to_light).first[:range]).to eq(7)
    end

    it "can get info for light_to_temperature" do
      expect(farm.chart_map(:light_to_temperature).first).to be_a(Hash)
      expect(farm.chart_map(:light_to_temperature).first[:source]).to eq(77)
      expect(farm.chart_map(:light_to_temperature).first[:destination]).to eq(45)
      expect(farm.chart_map(:light_to_temperature).first[:range]).to eq(23)
    end

    it "can get info for temperature_to_humidity" do
      expect(farm.chart_map(:temperature_to_humidity).first).to be_a(Hash)
      expect(farm.chart_map(:temperature_to_humidity).first[:source]).to eq(69)
      expect(farm.chart_map(:temperature_to_humidity).first[:destination]).to eq(0)
      expect(farm.chart_map(:temperature_to_humidity).first[:range]).to eq(1)
    end

    it "can get info for humidity_to_location" do
      expect(farm.chart_map(:humidity_to_location).first).to be_a(Hash)
      expect(farm.chart_map(:humidity_to_location).first[:source]).to eq(56)
      expect(farm.chart_map(:humidity_to_location).first[:destination]).to eq(60)
      expect(farm.chart_map(:humidity_to_location).first[:range]).to eq(37)
    end
  end

  describe "#conversion" do
    it "can convert seed_to_soil" do
      expect(farm.conversion(79, :seed_to_soil)).to eq(81)
    end

    it "can convert soil_to_fertilizer" do
      expect(farm.conversion(81, :soil_to_fertilizer)).to eq(81)
    end

    it "can convert fertilizer_to_water" do
      expect(farm.conversion(81, :fertilizer_to_water)).to eq(81)
    end

    it "can convert water_to_light" do
      expect(farm.conversion(81, :water_to_light)).to eq(74)
    end

    it "can convert light_to_temperature" do
      expect(farm.conversion(74, :light_to_temperature)).to eq(78)
    end

    it "can convert temperature_to_humidity" do
      expect(farm.conversion(78, :temperature_to_humidity)).to eq(78)
    end

    it "can convert humidity_to_location" do
      expect(farm.conversion(78, :humidity_to_location)).to eq(82)
    end
  end

  describe "#seed_to_location" do
    it "should convert a seed, to it's final location" do
      expect(farm.seed_to_location(79)).to eq(82)
      expect(farm.seed_to_location(14)).to eq(43)
    end
  end

  describe "#minimum_distance" do
    it "should take in all seeds, and return the minimum distance" do
      expect(farm.minimum_distance).to eq(35)
    end
  end
end