require 'open-uri'
require 'nokogiri'
require 'pry'

# Let's scrape recipes from http://www.epicurious.com

ingredient = 'avocado'
url = "https://www.bbcgoodfood.com/search/recipes?q=#{ingredient}"

html_file = open(url).read

html_doc = Nokogiri::HTML(html_file)
# binding.pry

html_doc.search('.standard-card-new__article-title').each do |element|
  puts element.text.strip
  puts element.attribute('href').value
end
