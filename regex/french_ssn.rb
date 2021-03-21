require 'pry'
require 'date'
require 'yaml'

SSN_PATTERN = /(?<sex>(1|2))\s(?<year>\d{2})\s(?<month>\d{2})\s(?<area>\d{2})\s\d{3}\s\d{3}\s(?<key>\d{2})/

def french_ssn_info(ssn)
  match_ssn = ssn.match(SSN_PATTERN)

  if match_ssn && check_key?(ssn, match_ssn[:key])

    # if sex == 1 it's man, etc.
    sex_data = sex(match_ssn[:sex])

    # interpolate our year
    year_data = "19#{match_ssn[:year]}"

    # take the month and turn it into month name
    month_data = Date::MONTHNAMES[match_ssn[:month].to_i]

    # search our yaml file && match our data
    zip = zip_yaml(match_ssn[:area])

    # a man, born in December, 1984 in Seine-Maritime.
    "a #{sex_data}, born in #{month_data}, #{year_data} in #{zip}."
  else
    "The number is invalid"
  end
end

def check_key?(ssn, key)
  # (97 - ssn_without_key) by 97 must equal our key
  (97 - ssn[0..-4].gsub(' ', '').to_i) % 97 == key.to_i
end

def sex(sex)
  sex == "1" ? "man" : "woman"
end

def zip_yaml(area)
  YAML.load_file('data/french_departments.yml')[area]
end

