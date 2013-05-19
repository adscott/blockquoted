require './app'
require 'rspec'
require 'rack/test'

set :environment, :test

describe 'blockquoted' do
  include Rack::Test::Methods

  def app
    Sinatra::Application
  end

  it 'renders a quote on the homepage' do
    get '/'
    last_response.should be_ok
    last_response.body.should have_tag 'blockquote'
  end

  it 'renders a specific quote' do
    get '/tbwszs13'
    last_response.should be_ok
    last_response.body.should have_tag('blockquote', :text => 'If you didn\'t write it, mock it.')
  end

  it 'shows not found for anything else' do
    get '/not_here'
    puts last_response.should be_not_found
  end
end
