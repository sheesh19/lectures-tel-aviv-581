require_relative 'chef'

class Restaurant
  attr_reader :name, :clients, :city, :chef

  def initialize(name, city, chef_name, chef_years)
    @name = name
    @city = city
    @clients = []

    # create a new chef
    # pass it an instance of Restaurant
    # self inside of an instance method refers to the instance it's called on
    @chef = Chef.new(chef_name, chef_years, self)
  end

  # Class method
  # def Restaurant.categories
  # self takes whatever it is defined inside of

  def self.categories
    ["thai", "dumplings", "mexican", "italian"]
  end


  # instance methods
  def add_reservation(name)
    @clients << name
  end

  def print_clients
    @clients.each_with_index do |client, index|
      puts "#{index + 1}. #{client}"
    end
  end

  def open?
    Time.now.hour > 18 && Time.now.hour < 22
  end

  def closed?
    !open?
  end
end
