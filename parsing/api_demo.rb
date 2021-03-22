require 'json'
require 'open-uri'
require 'pry'

# TODO - Let's fetch name and bio from a given GitHub username
url = 'https://api.github.com/users/sheesh19'

user_serialized = open(url).read

# binding.pry
user = JSON.parse(user_serialized)

puts user["location"]
puts user["bio"]
