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

  describe 'when the url is already short' do
    let(:attrs) { { :url => 'http://www.google.com/' } }

    its(:link_text) { should == 'www.google.com/' }
  end

end
