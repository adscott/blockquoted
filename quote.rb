class Quote

  attr_reader :copy, :author, :citation_url, :citation_text

  def initialize(attrs)
    @copy = attrs[:copy] || ''
    @author = attrs[:author] || ''
    @citation_url = attrs[:citation_url] || ''
    @citation_text = attrs[:citation_text] || generate_citation_text
  end

  def has_citation?
    citation_text.length > 0
  end

  def has_citation_url?
    citation_url.length > 0
  end

  def hash_string
    Digest::SHA1.hexdigest(copy + citation_text + citation_url).hex.to_s(36)[0..7]
  end

  private
  def generate_citation_text
    return '' unless has_citation_url?
    uri = URI(citation_url)
    host = uri.host
    path_chunks = uri.path.split('/')
    path = path_chunks.length > 2 ? "/.../#{path_chunks.last}" : uri.path
    query = uri.query.nil? ? '' : "?#{uri.query}"
    fragment = uri.fragment.nil? ? '' : "##{uri.fragment}"
    long_url = path == '/' && query == '' && fragment == '' ? host : "#{host}#{path}#{query}#{fragment}"
    long_url.length > 50 ? "#{long_url[0..46]}..." : long_url
  end

end
