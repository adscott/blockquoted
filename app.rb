require 'sinatra'
require 'sinatra/json'
require 'yaml'
require 'hashie'
require 'json'
require './models/quote'

QUOTES = YAML.load_file('quotes.yml').map { |e| Quote.new(Hashie::Mash.new(e)) }

def fetch_quote
  QUOTES.sample
end

set :json_encoder, JSON

get '/' do
  haml :quote
end

get '/random' do
  json fetch_quote
end

get '/quote/:quote_hash_string' do |quote_hash_string|
  json find_quote(quote_hash_string)
end

get '/:quote_hash_string' do |quote_hash_string|
  quote = find_quote(quote_hash_string)
  pass if quote.nil?
  haml :quote
end

def find_quote(hash_string)
  QUOTES.find { |quote| hash_string == quote.hash_string }
end
