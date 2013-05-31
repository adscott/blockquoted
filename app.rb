require 'sinatra'
require 'sinatra/json'
require 'yaml'
require 'hashie'
require 'json'
require 'sass'
require './models/quote'

QUOTES = YAML.load_file('quotes.yml').map { |e| Quote.new(Hashie::Mash.new(e)) }

def fetch_quote
  QUOTES.sample
end

def find_quote(hash_string)
  QUOTES.find { |quote| hash_string == quote.hash_string }
end

def far_future
  Time.now + 60*60*24*356*3
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

get '/stylesheets/:stylesheet.css' do |stylesheet|
  expires far_future, :public, :must_revalidate
  scss :"stylesheets/#{stylesheet}"
end

helpers do
  def versioned_static(path)
    "#{path}?#{File.mtime(File.join(Sinatra::Application.public_folder, path))}"
  end

  def versioned_stylesheet(stylesheet)
    "/stylesheets/#{stylesheet}.css?#{File.mtime(File.join(Sinatra::Application.views, 'stylesheets', "#{stylesheet}.scss")).to_i.to_s}"
  end

  def versioned_javascript(js)
    versioned_static("/javascripts/#{js}.js")
  end
end
