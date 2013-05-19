require './quote'

describe Quote do

  subject { Quote.new(attrs) }

  describe 'when it has no copy' do
    let(:attrs) { {} }

    its(:copy) { should == '' }
  end

  describe 'when it just has copy' do
    let(:attrs) { { :copy => 'some copy' } }

    it { should_not have_link }
    it { should_not have_author }
  end

  describe 'when it has all of its attributes' do
    let(:attrs) { { :copy => 'some copy', :author => 'William S.', :url => 'http://en.wikipedia.org/wiki/William_Shakespeare?some_long_part=of_the_query_string' } }

    it { should have_link }
    it { should have_author }
    its(:copy) { should == 'some copy' }
    its(:author) { should == 'William S.' }
    its(:url) { should == 'http://en.wikipedia.org/wiki/William_Shakespeare?some_long_part=of_the_query_string' }
    its(:link_text) { should == 'en.wikipedia.org/.../William_Shakespeare?some_l...' }
  end

  describe 'url shortening' do
    let(:attrs) { { :url => url } }

    describe 'when the url is already short' do
      let(:url) { 'http://www.google.com/foo' }

      its(:link_text) { should == 'www.google.com/foo' }
    end

    describe 'when the url is just the domain' do
      let(:url) { 'http://www.google.com/' }

      its(:link_text) { should == 'www.google.com' }
    end
  end

  describe 'hashing' do
    let(:attrs) { { :copy => 'a', :url => 'http://b.com/', :author => 'c' } }

    its(:hash_string) { should == 'r9dgu7aa' }
  end

end
