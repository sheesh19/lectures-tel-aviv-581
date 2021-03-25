require_relative 'pokemon'

class ElectricPokemon < Pokemon

  def move
    "#{@name.capitalize} uses Thunderbolt"
  end

  def hit_by(move)
    "#{super(move)}. It was super effective!"
  end
end
