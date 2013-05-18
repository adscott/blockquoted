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
    let(:attrs) { { :copy => 'some copy', :author => 'William S.', :url => 'http://en.wikipedia.org/wiki/William_Shakespeare' } }

    it { should have_link }
    it { should have_author }
    its(:copy) { should == 'some copy' }
    its(:author) { should == 'William S.' }
    its(:url) { should == 'http://en.wikipedia.org/wiki/William_Shakespeare' }
  end

end
