require_relative '../models/patient'
require_relative 'room_repository'
require 'csv'
require 'pry'

# PatientRepository class
# load our csv && add the patients to our patients array
# take a csv

class PatientRepository
  attr_reader :patients

  def initialize(csv_file, room_repo)
    @csv_file = csv_file
    @room_repo = room_repo
    @patients = []
    @next_id = 1
    load_csv
  end

  def add(patient)
    # patient has name, room, && cured but not id yet
    # we need to set the id
    patient.id = @next_id

    # store it in our array
    @patients << patient

    # increment @next_id
    @next_id += 1

    # update our csv
    save_csv
  end

  private

  def save_csv
    CSV.open(@csv_file, "wb") do |file|
      file << [ "id", "name", "cured", "room_id"]

      @patients.each do |patient|
        file << [ patient.id, patient.name, patient.cured?, patient.room.id ]
      end
    end
  end

  def load_csv
    csv_options = { headers: :first_row, header_converters: :symbol }

    CSV.foreach(@csv_file, csv_options) do |row|
      # Typecasting => updating our data types

      row[:id]    = row[:id].to_i          # Convert column to Integer
      row[:cured] = row[:cured] == "true"  # Convert column to boolean

      # room_id => find the instance of Room
      room = @room_repo.find(row[:room_id].to_i)

      # associate the instance of room to our patient
      patient = Patient.new(row)
      patient.room = room

      # add the patient to our patients array
      @patients << patient
    end

    # update our @next_id to store the value of the next id for our patients array
    @next_id = @patients.last.id + 1 unless @patients.empty?
  end
end


# patients = []
# csv_options = { headers: :first_row, header_converters: :symbol }
# csv_file = File.join(__dir__, '../data/patients.csv')

# CSV.foreach(csv_file, csv_options) do |row|
#   row[:id]    = row[:id].to_i          # Convert column to Integer
#   row[:cured] = row[:cured] == "true"  # Convert column to boolean
#   patients << Patient.new(row)
# end

# p patients


csv_file = File.join(__dir__, '../data/patients.csv')
csv_file_room = File.join(__dir__, '../data/rooms.csv')

room_repo = RoomRepository.new(csv_file_room)
patient_repo = PatientRepository.new(csv_file, room_repo)

luna = Patient.new(name: "Luna")
luna.room = room_repo.rooms.last

patient_repo.add(luna)


p patient_repo.patients
