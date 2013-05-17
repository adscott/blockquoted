require 'haml'
require 'rspec-html-matchers'
require 'ostruct'

describe 'index.haml' do

  let(:copy) { 'Some copy' }
  subject { Haml::Engine.new(File.read('site/index.haml')).render(OpenStruct.new(:quote => {:copy => copy})) }
	
  it { should have_tag('p') { with_text copy } }
	
end