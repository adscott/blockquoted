require 'haml'
require 'rspec-html-matchers'
require 'hashie'

describe 'index.haml' do

  let(:copy) { 'Hello World!' }
  let(:quote) { { :copy => copy } }
  subject { Haml::Engine.new(File.read('site/index.haml')).render(Hashie::Mash.new({ :fetch_quote => quote })) }

  it { should have_tag('blockquote', :text => copy) { without_tag 'footer' } }

  describe 'when there is an author' do
    let(:author) { 'Brian Kernighan' }
    let(:quote) { { :copy => copy, :author => author } }

    it { should have_tag('blockquote') { with_tag('footer', :text => author) } }
  end

  describe 'when there is a url' do
    let(:url) { 'https://en.wikipedia.org/wiki/Hello_world_program' }
    let(:quote) { { :copy => copy, :url => url } }

    it { should have_tag('blockquote') { with_tag 'footer' } }
    it { should have_tag('footer') { with_tag('a', :text => url, :with => { :href => url }) } }
  end

end
