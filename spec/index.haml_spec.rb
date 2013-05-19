require 'haml'
require 'rspec-html-matchers'
require 'hashie'

describe 'index.haml' do

  let(:copy) { 'Hello World!' }
  let(:author) { 'Brian Kernighan' }
  let(:url) { 'https://en.wikipedia.org/wiki/Hello_world_program' }
  let(:link_text) { 'en.wikipedia.org/.../Hello_world_program' }
  let(:hash_string) { '123456' }
  let(:has_author) { false }
  let(:has_link) { false }
  let(:quote) { {
    :copy => copy,
    :author => author,
    :has_author? => has_author,
    :url => url,
    :link_text => link_text,
    :has_link? => has_link,
    :hash_string => hash_string
  } }

  subject { Haml::Engine.new(File.read('site/index.haml')).render(Hashie::Mash.new({ :quote => quote })) }

  describe 'when there is just copy' do
    it { should have_tag('blockquote', :text => copy) { with_tag 'footer' } }
    it { should have_tag('footer') { with_tag('a', :with => { :href => '/123456' }) } }
  end

  describe 'when there is an author' do
    let(:has_author) { true }

    it { should have_tag('blockquote') { with_tag('footer', :text => author) } }
  end

  describe 'when there is a url' do
    let(:has_link) { true }

    it { should have_tag('blockquote') { with_tag 'footer' } }
    it { should have_tag('footer') { with_tag('a', :text => link_text, :with => { :href => url }) } }
  end

end
