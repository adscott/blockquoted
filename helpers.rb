require 'yaml'
require 'hashie'
require './quote'

QUOTES = YAML.load_file('quotes.yml').map { |e| Hashie::Mash.new(e) }

def fetch_quote
  Quote.new(QUOTES.sample)
end
