class Patient
  attr_reader :name
  attr_accessor :room, :id
  # def initialize(name, cured, disease, age, room, doctor, etc. etc.)

  def initialize(attributes = {})
    @id = attributes[:id]
    @name = attributes[:name] # => string
    @cured = attributes[:cured] || false # => boolean
    @room = attributes[:room]
  end

  def cure
    @cured = true
  end

  def cured?
    @cured
  end
end


# frodo = Patient.new(cured: true, name: "frodo")
# p frodo
