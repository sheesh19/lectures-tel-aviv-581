require_relative 'electric_pokemon'
require_relative 'water_pokemon'
require_relative 'fire_pokemon'
require_relative 'grass_pokemon'

pikachu = ElectricPokemon.new("pikachu")
squirtle = WaterPokemon.new("squirtle")
charmander = FirePokemon.new("charmander")
bulbasaur = GrassPokemon.new("bulbasaur")

# pokemon = [ pikachu.move, squirtle.move, charmander.move, bulbasaur.move ]
# puts pokemon

# puts Pokemon.starter_types

puts pikachu.hit_by("mudslap")
puts charmander.hit_by("charm")
