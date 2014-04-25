require_relative '../services/entry_fetch_service'

class EntryFetchMapper
  def initialize(fetch_service = EntryFetchService)
    @fetch_service = fetch_service
  end

  def fetch(url)
    @url = url

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
