require 'rss'
require 'open-uri'
require 'active_support/all'

class EntryFetchService
  cattr_accessor :backend

  def self.fetch(url)
    backend.fetch(url)
  end

  class FeedSiteBackend
    def self.fetch(url)
      open(url) do |rss|
        RSS::Parser.parse(rss).items
      end
    end
  end
end
