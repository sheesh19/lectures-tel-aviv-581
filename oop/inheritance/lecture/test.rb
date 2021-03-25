require_relative 'restaurant'
require_relative 'fastfood'
require_relative 'star_restaurant'


# hutong = Restaurant.new("Hutong", "Melbourne", 20, "dumplings")
# puts hutong.name
# puts hutong.capacity = 30

# hutong.add_reservation("Harry Potter")
# p hutong.clients
# p hutong.open?

# Restaurant for us
# class SuperClass
# end

# class ChildClass < SuperClass
# end

# chipotle = Fastfood.new("chipotle", "San Francisco", 7)
# puts "#{chipotle.name} takes #{chipotle.prep_time} minutes"
# chipotle.add_reservation("Harry Potter")
# chipotle.add_reservation("Hermione Granger")
# chipotle.print_clients

# fancy = StarRestaurant.new("Ash", "Atlanta", 2)
# fancy.add_reservation("Frodo Baggins")
# fancy.add_reservation("Samwise Gamgee")
# fancy.print_clients


# CLASS METHODS
# Time.now
# JSON.parse()


# p Restaurant.categories

# krua_thai = Restaurant.new("Khrua Thai", "Melbourne", "Paul Hollywood", 20)
# puts "#{krua_thai.name}'s chef name is #{krua_thai.chef.name}"


# ------------------------------------------
# ------------------RECAP-------------------
# ------------------------------------------

# Inheritance
# => similar to yield; you need to understand but you won't define it every day
# => class SuperClass
# => class ChildClass < SuperClass


# 'super' => use the same method as the SuperClass but add to it

# 'self'
# inside of an instance method, we use 'self' to refer to the instance itself / the instance the method is called on
# inside of a class, we use 'self' to define Class methods... i.e. 'self.categories'

# Class methods => methods a class can perform -> not one particular instance






