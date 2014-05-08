require 'open-uri'
require 'feed_duck'

class EntryFetchService
  class << self
    def backend
      @backend
    end

    def backend=(backend)
      @backend = backend
    end

    def fetch(url)
      backend.fetch(url)
    end
  end

  class FeedSiteBackend
    def self.fetch(url)
      open(url) do |rss|
        FeedDuck::Parser.parse(rss)
      end
    end
  end
end
