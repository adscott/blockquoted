require 'haml'
require 'rspec-html-matchers'
require 'hashie'

describe 'index.haml' do

  let(:copy) { 'Some copy' }
  subject { Haml::Engine.new(File.read('site/index.haml')).render(Hashie::Mash.new(:quote => {:copy => copy})) }

  it { should have_tag('blockquote') { with_text copy } }

end
