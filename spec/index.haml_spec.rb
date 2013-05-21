require 'haml'
require 'rspec-html-matchers'
require 'hashie'

describe 'index.haml' do

  let(:copy) { 'Hello World!' }
  let(:citation_text) { 'Brian Kernighan' }
  let(:citation_url) { 'https://en.wikipedia.org/wiki/Hello_world_program' }
  let(:hash_string) { '123456' }
  let(:has_citation) { false }
  let(:has_citation_url) { false }
  let(:quote) { {
    :copy => copy,
    :citation_text => citation_text,
    :citation_url => citation_url,
    :has_citation? => has_citation,
    :has_citation_url? => has_citation_url,
    :hash_string => hash_string
  } }

  subject { Haml::Engine.new(File.read('site/index.haml')).render(Hashie::Mash.new({ :quote => quote })) }

  describe 'when there is just copy' do
    it { should have_tag('blockquote', :text => copy) { with_tag 'footer' } }
    it { should have_tag('footer') { with_tag('a', :with => { :href => '/123456' }) } }
  end

  describe 'when there is an author' do
    let(:has_citation) { true }

    it { should have_tag('blockquote') { with_tag('footer', :text => citation_text) } }
  end

  describe 'when there is a url' do
    let(:has_citation) { true }
    let(:has_citation_url) { true }

    it { should have_tag('blockquote') { with_tag 'footer' } }
    it { should have_tag('footer') { with_tag('a', :text => citation_text, :with => { :href => citation_url }) } }
  end

end
