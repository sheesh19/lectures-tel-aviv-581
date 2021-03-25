class Chef
  attr_accessor :name, :years, :restaurant

  def initialize(name, years, restaurant)
    @name = name # string
    @years = years # integer
    @restaurant = restaurant # pass an instance
  end
end
