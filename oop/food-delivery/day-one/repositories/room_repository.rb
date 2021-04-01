require_relative '../models/room'
require 'csv'

class RoomRepository
  attr_reader :rooms

  def initialize(csv_file)
    @csv_file = csv_file
    @rooms = []
    load_csv
  end


  def find(id)
    # find method for our room using the id
    @rooms.find { |room| room.id == id }
  end

  private

  def load_csv
    csv_options = { headers: :first_row, header_converters: :symbol }

    CSV.foreach(@csv_file, csv_options) do |row|
      row[:id]    = row[:id].to_i          # Convert column to Integer
      row[:capacity] = row[:capacity].to_i  # Convert column to boolean
      @rooms << Room.new(row)
    end
  end
end

# csv_file = File.join(__dir__, '../data/rooms.csv')

# room_repo = RoomRepository.new(csv_file)

# p room_repo.rooms
