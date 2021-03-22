require 'json'
require 'pry'

# TODO - let's read/write data from beers.json
filepath    = 'data/beers.json'

# serialized_beers = File.read(filepath)

# # p serialized_beers

# beers = JSON.parse(serialized_beers)


# # binding.pry
# p beers


beers = { beers: [
  {
    name:       'Edelweiss',
    appearance: 'White',
    origin:     'Austria'
  },
  {
    name:       'Guinness',
    appearance: 'Stout',
    origin:     'Ireland'
  },
]}

File.open(filepath, 'wb') do |file|
  file.write(JSON.generate(beers))
end
