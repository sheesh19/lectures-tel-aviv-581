require 'pry'

class Car

  attr_reader :make, :model   # getter
  # attr_writer :color        # setter
  attr_accessor :color # => color has reader & writer

  def initialize(color, make, model)
    # @color is an instance variable
    # we can use instance variables in our class methods
    @color = color
    @make = make
    @model = model
    @engine_started = false
  end

  # an instance method
  def engine_started?
    # Car.engine_started == bad
    # lola.engine_started == good => instance method
    @engine_started
  end

  def start_engine
    @engine_started = true
    spark_plug
    fuel_pump
    puts "the engine is started!"
  end

  private

  def spark_plug
    puts "sparked!"
  end

  def fuel_pump
    puts "fuel is pumped"
  end

  # attr_reader :color is a short for this method
  # def color
  #   @color
  # end

  # attr_writer :color
  # def color=(color)
  #   @color = color
  # end
end


lola = Car.new("teal", "Toyota", "Corolla")

binding.pry

lola
