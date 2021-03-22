require 'nokogiri'
require 'open-uri'
require 'pry'

# - fetch_movie_urls
# define our url
# open && read our url
# parse it into Nokogiri
# inspect our HTML for a specific class
# search our Nokogiri for the TOP 5 urls


# - scrape_movie
# define our url
# open && read our url
# parse it into Nokogiri
# inspect our HTML for a specific class
# create our hash
# fill the hash with the keys (cast, director, storyline, title, year)
# update our hash with the scraped values

def fetch_movie_urls
  url = "https://www.imdb.com/chart/top"
  html_file = open(url, "Accept-Language" => "en").read

  html_doc = Nokogiri::HTML(html_file)
  html_doc.search('.titleColumn > a').first(5).map do |element|
    "http://www.imdb.com#{element.attributes["href"].value}"
  end
end

def scrape_movie(movie_url)
  html_file = open(movie_url, "Accept-Language" => "en").read
  html_doc = Nokogiri::HTML(html_file)

  {
    cast: html_doc.search('.credit_summary_item').last.children[3..7].text.split(', '),
    director: html_doc.search('.credit_summary_item').first.children[-2].text,
    storyline: html_doc.search('.summary_text').text.strip,
    title: html_doc.search('.title_wrapper > h1').text.strip[0..-8],
    year: html_doc.search('.title_wrapper > h1').text.strip[-5..-2].to_i,
  }
end




















