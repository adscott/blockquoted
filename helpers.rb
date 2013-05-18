require 'yaml'
require 'hashie'
require './quote'

QUOTES = YAML.load_file('quotes.yml').map { |e| Quote.new(Hashie::Mash.new(e)) }

def fetch_quote
  QUOTES.sample
end
