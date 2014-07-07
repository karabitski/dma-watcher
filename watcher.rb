#!/usr/bin/env ruby
require './config/environment.rb'

output = [
  {id: 1, name: "CouchBase", country: "USA", website: "http://couchbase.com/"},
  {id: 2, name: "Ffifty One", country: "USA", website: "http://fiftyone.com/"},
  {id: 3, name: "Forsythe", country: "USA", website: "http://forsythe.com/"}
]

accounts = output.map do |acc|
					  Account.new id: acc[:id], name: acc[:name], country: acc[:country], website: acc[:website] 
					 end
COUNTRY_MAPPINGS = {
  "USA" =>         "us",
  "UK" =>          "us", 
  "Ireland" =>     "us", 
  "Australia" =>   "us",
  "Germany" =>     "de",
  "Austria" =>     "de",
  "Switzerland" => "de",
  "Sweden" =>      "se",
  "Norway" =>      "se",
  "Denmark" =>     "dk",
  "Finland" =>     "fi"
}

def create_keywords
	data = YAML.load(File.open File.dirname(__FILE__) + '/config/keywords.yml')
	# TODO: remove mappings from keywords.yml
	mappings = data.delete 'mappings'

	data.each do |code, words|
	  create_keyword(code, words)
	end
end

def create_keyword(code, words, parent = nil)
  words.each do |w|
  	if w.is_a?(String)
      Keyword.create! region: code, keyword: w, parent: parent
    elsif w.is_a?(Hash)
       k = Keyword.create! region: code, keyword: w.keys.first, parent: parent
       create_keyword code, w.values.first, k
    end
  end
end

# create_keywords
agent = Mechanize.new
accounts.each do |account|
  page = agent.get account.website
  first_page_keywords = Keyword.where(region: 'us').roots.map{|k| k.keyword if k.is_childless? }.compact
  links = page.links.find_all { |l|  Regexp.new(first_page_keywords.join('|'), true).match l.text }

end
