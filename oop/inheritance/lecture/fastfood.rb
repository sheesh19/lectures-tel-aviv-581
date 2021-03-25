class Fastfood < Restaurant
  attr_reader :prep_time

  def initialize(name, city, prep_time)
    # calling the initialize method in our Restaurant class
    # instantiates name, city, & clients lines
    super(name, city)
    @prep_time = prep_time
  end

  def print_clients
    puts "---#{@name}---"
    # calls the method 'print_clients' in our Restaurant class
    super
    puts "--------------"
  end
end
