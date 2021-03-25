require_relative 'pokemon'

class WaterPokemon < Pokemon

  # we don't need initialize if we inherit
  def move
    "#{@name.capitalize} uses Water Gun"
  end
end
