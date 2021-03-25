require_relative 'pokemon'

class FirePokemon < Pokemon

  def move
    "#{@name.capitalize} uses Flame Thrower"
  end
end
