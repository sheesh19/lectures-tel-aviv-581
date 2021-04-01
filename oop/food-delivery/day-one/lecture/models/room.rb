require_relative 'patient'
require 'pry'

class Room

  class CapacityError < StandardError; end

  attr_reader :patients
  attr_accessor :id

  def initialize(attributes = {})
    @id = attributes[:id]
    @capacity = attributes[:capacity] || 0
    @patients = attributes[:patients] || []
  end

  def full?
    @patients.size == @capacity
  end

  def add_patient(patient)

    if full?
      # puts "Our room is too full!"

      raise CapacityError, "Room is too full!"

    else
      associate patient && room
      patient.room = self
      @patients << patient
    end
  end
end


# assign a patient to a room && return the room from the patient
# frodo = Patient.new(name: "frodo")

# room = Room.new(capacity: 0)
# room.add_patient(frodo)

# p room.patients


