require 'sinatra'
require 'yaml'
require 'hashie'
require './quote'

QUOTES = YAML.load_file('quotes.yml').map { |e| Quote.new(Hashie::Mash.new(e)) }

def fetch_quote
  QUOTES.sample
end

template_dir = 'site'

set :public_folder, template_dir
set :views, template_dir

get '/' do
  haml :index, :locals => { :quote => fetch_quote }
end

get '/:quote_hash_string' do |quote_hash_string|
  quote = QUOTES.find { |quote| quote_hash_string == quote.hash_string }
  haml :index, :locals => { :quote => quote } 
end
