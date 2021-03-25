require_relative 'pokemon'

class GrassPokemon < Pokemon

  def move
    "#{@name.capitalize} uses Razor Leaf"
  end
end
