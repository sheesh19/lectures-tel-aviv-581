class Pokemon
  attr_reader :name

  def initialize(name)
    @name = name
  end

  def self.starter_types
    ["water", "fire", "grass"]
  end

  def hit_by(move)
    "#{@name.capitalize} was hit by #{move}"
  end
end
