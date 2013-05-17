require 'yaml'
require 'hashie'

QUOTES = YAML.load_file('quotes.yml').map { |e| Hashie::Mash.new(e) }

def quote
  QUOTES.sample
end
