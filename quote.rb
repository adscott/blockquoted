class Quote

  attr_reader :copy, :author, :url

  def initialize(attrs)
    @copy = attrs[:copy] || ''
    @author = attrs[:author]
    @url = attrs[:url]
  end

  def has_author?
    !author.nil?
  end

  def has_link?
    !url.nil?
  end

end
