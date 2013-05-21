require './quote'

describe Quote do

  subject { Quote.new(attrs) }

  describe 'when it has no copy' do
    let(:attrs) { {} }

    its(:copy) { should == '' }
  end

  describe 'when it just has copy' do
    let(:attrs) { { :copy => 'some copy' } }

    it { should_not have_citation }
    it { should_not have_citation_url }
  end

  describe 'when it has all of its attributes' do
    let(:attrs) { { :copy => 'some copy', :citation_text => 'William S.', :citation_url => 'http://en.wikipedia.org/wiki/William_Shakespeare?some_long_part=of_the_query_string' } }

    it { should have_citation }
    its(:copy) { should == 'some copy' }
    its(:citation_url) { should == 'http://en.wikipedia.org/wiki/William_Shakespeare?some_long_part=of_the_query_string' }
    its(:citation_text) { should == 'William S.' }
  end

  describe 'when it just has citation text' do
    let(:attrs) { { :citation_text => 'Plato' } }
    it { should have_citation }
    it { should_not have_citation_url }
  end

  describe 'citation url shortening' do
    let(:attrs) { { :citation_url => citation_url } }

    describe 'when the citation_url is already short' do
      let(:citation_url) { 'http://www.google.com/foo' }

      it { should have_citation }
      it { should have_citation_url }
      its(:citation_text) { should == 'www.google.com/foo' }
    end

    describe 'when the citation url is just the domain' do
      let(:citation_url) { 'http://www.google.com/' }
      its(:citation_text) { should == 'www.google.com' }
    end

    describe 'when there link text is provided' do
      let(:citation_url) { 'http://www.foo.com' }
      let(:citation_text) { 'bar' }
      let(:attrs) { { :citation_url => citation_url, :citation_text => citation_text } }

      its(:citation_text) { should == citation_text }
    end
  end

  describe 'hashing' do
    let(:attrs) { { :copy => 'a', :citation_url => 'http://b.com/', :author => 'c' } }

    its(:hash_string) { should == 'ef3isest' }
  end

end
