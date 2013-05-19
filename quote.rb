class Quote

  attr_reader :copy, :author, :url

  def initialize(attrs)
    @copy = attrs[:copy] || ''
    @author = attrs[:author] || ''
    @url = attrs[:url] || ''
  end

  def has_author?
    author.length > 0
  end

  def has_link?
    url.length > 0
  end

  def link_text
    uri = URI(url)
    host = uri.host
    path_chunks = uri.path.split('/')
    path = path_chunks.length > 2 ? "/.../#{path_chunks.last}" : uri.path
    query = uri.query.nil? ? '' : "?#{uri.query}"
    fragment = uri.fragment.nil? ? '' : "##{uri.fragment}"
    long_url = path == '/' && query == '' && fragment == '' ? host : "#{host}#{path}#{query}#{fragment}"
    long_url.length > 50 ? "#{long_url[0..46]}..." : long_url
  end

  def hash_string
    Digest::SHA1.hexdigest(copy + author + url).hex.to_s(36)[0..7]
  end

end
