# This is a template for a Ruby scraper on morph.io (https://morph.io)
# including some code snippets below that you should find helpful

require 'scraperwiki'
require 'mechanize'
#
agent = Mechanize.new
#
# # Read in a page
url = "https://en.wikipedia.org/wiki/List_of_Star_Wars_characters"
page = agent.get(url)
#
# # Find somehing on the page using css selectors

page.at('#mw-content-text').search('dt')[0]
page.at('dl').search('dd')[0]

page.at('#mw-content-text').search('dt').each do |dt|
  character = {
    character: dt.text,
  }

  p character
  ScraperWiki.save_sqlite([:character], character)

end

#
# # Write out to the sqlite database using scraperwiki library

#ScraperWiki.save_sqlite(["name"], {name: name, description: description})

#
# # An arbitrary query against the database
# ScraperWiki.select("* from data where 'name'='peter'")

# You don't have to do things with the Mechanize or ScraperWiki libraries.
# You can use whatever gems you want: https://morph.io/documentation/ruby
# All that matters is that your final data is written to an SQLite database
# called "data.sqlite" in the current working directory which has at least a table
# called "data".
