require_relative '../pokemon'
require_relative '../water_pokemon'

describe Pokemon do
  describe "#initialize" do
    it "creates a new Pokemon instance" do
      pikachu = Pokemon.new("pikachu")
      expect(pikachu).to be_a(Pokemon)
    end
  end

  describe "::starter_types" do
    it "returns an array of three starter types" do
      starter_types = Pokemon.starter_types
      expect(starter_types.size).to eq(3)
    end
  end

  describe "#hit_by()" do
    it "returns a string stating the pokemon was hit" do
      squirtle = WaterPokemon.new("squirtle")
      sentence = squirtle.hit_by("flamethrower")
      expect(sentence).to eq("Squirtle was hit by flamethrower")
    end
  end
end
