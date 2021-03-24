require_relative "../citizen"


describe Citizen do

  describe "#can_vote?" do
    it "returns true if the age is greater than or equal to 18" do
      citizen = Citizen.new("harry", "potter", 21)
      actual = citizen.can_vote?
      expected = true
      expect(actual).to eq(expected)
    end

    it "returns false if the age is less than 18" do
      citizen = Citizen.new("frodo", "baggins", 17)
      actual = citizen.can_vote?
      expected = false
      expect(actual).to eq(expected)
    end
  end

  describe "#full_name" do
    it "returns the nicely formatted full name of the citizen" do
      citizen = Citizen.new("harry", "potter", 21)
      actual = citizen.full_name
      expected = "Harry Potter"
      expect(actual).to eq(expected)
    end

    it "returns the nicely formatted full name of the citizen even if input is garbage" do
      citizen = Citizen.new("froDo", "baGGins", 21)
      actual = citizen.full_name
      expected = "Frodo Baggins"
      expect(actual).to eq(expected)
    end
  end
end




