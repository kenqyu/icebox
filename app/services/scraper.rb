require 'pismo'

class Scraper
  attr_reader :url, :title, :body

  def initialize(attr = {})
    @url   = attr.fetch(:url)
    doc    = Pismo::Document.new(url)
    @title = doc.title
    @body  = doc.body
  end
end
