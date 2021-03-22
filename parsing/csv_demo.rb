require 'csv'

# TODO - let's read/write data from beers.csv
filepath    = 'data/beers.csv'

# FORCE OUR CSVs into hashes
# csv_options = { col_sep: ',', quote_char: '"', headers: :first_row }


# CSV.foreach(filepath, csv_options) do |row|
#   # puts "#{row[0]} | #{row[1]} | #{row[2]}"

#   # puts "#{row["Name"]}"

#   puts "#{row["Name"]} | #{row["Appearance"]} | #{row["Origin"]}"
# end


csv_options = { col_sep: ',', force_quotes: true, quote_char: '"' }

CSV.open(filepath, 'wb', csv_options) do |csv|
  csv << ['Name', 'Appearance', 'Origin']
  csv << ['Asahi', 'Pale Lager', 'Japan']
  csv << ['Guinness', 'Stout', 'Ireland']
end

























