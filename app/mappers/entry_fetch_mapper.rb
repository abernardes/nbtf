require_relative '../services/entry_fetch_service'

class EntryFetchMapper
  def initialize(url, fetch_service = EntryFetchService)
    @url, @fetch_service = url, fetch_service
  end

  def fetch
    entries.map do |entry|
      {
        author: entry.author,
        published_at: entry.pubDate,
        title: entry.title,
        content: entry.description,
        url: entry.link,
        id: entry.guid.content
      }
    end
  end

  private

  attr_reader :fetch_service, :url

  def entries
    fetch_service.fetch(url)
  end
end
