require_relative '../services/entry_fetch_service'

class EntryFetchMapper
  def initialize(fetch_service = EntryFetchService)
    @fetch_service = fetch_service
  end

  def fetch(url)
    @url = url

    map_feed(feed)
  end

  private

  attr_reader :fetch_service, :url

  def feed
    @feed ||= fetch_service.fetch(url)
  end

  def map_feed(feed)
    feed.to_h[:entries]
  end
end

