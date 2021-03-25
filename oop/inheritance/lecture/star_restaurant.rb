class StarRestaurant < Restaurant
  attr_reader :stars

  def initialize(name, city, stars)
    super(name, city)
    @stars = stars
  end

  # methods with the same name override our SuperClass methods
  def print_clients
    puts "You cannot see our special reservation clients"
  end
end
