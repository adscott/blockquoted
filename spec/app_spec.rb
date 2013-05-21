require './app'
require 'rspec'
require 'json'
require 'rack/test'

set :environment, :test

describe 'blockquoted' do
  include Rack::Test::Methods

  def app
    Sinatra::Application
  end

  subject { last_response }
  before { get path }

  describe 'when rendering html' do

    describe 'when fetching the homepage' do
      let(:path) { '/' }
      it { should be_ok }
    end

    describe 'when fetching a specific quote' do
      let(:path) { '/tbwszs13' }
      it { should be_ok }
    end

    describe 'when trying to find a nonexistant page' do
      let(:path) { '/not_here' }
      it { should be_not_found }
    end

  end

  describe 'when rendering json' do

    describe 'when fetching a random quote' do
      let(:path) { '/random' }
      it { should be_ok }

      describe 'when inspecting response body' do
        subject { JSON.parse(last_response.body) }
        it { should have_key 'copy' }
      end

    end

    describe 'when rendering a specific quote' do
      let(:path) { '/quote/tbwszs13' }
      it { should be_ok }

      describe 'when inspecting response body' do
        subject { JSON.parse(last_response.body) }
        it { should have_key 'copy' }
      end
    end

  end
end
