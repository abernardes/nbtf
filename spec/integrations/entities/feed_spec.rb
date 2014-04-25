require_relative '../../../app/entities/feed'

class FeedFixtureBackend
  def self.fetch(url)
    File.open('spec/fixtures/feed_fixture.rss', 'r') do |rss|
      RSS::Parser.parse(rss).items
    end
  end
end

describe Feed do
  let(:url) { "http://example.com/feed" }
  let(:user) { double(:user) }

  describe ".initialize" do
    it "sets the feed's endpoint URL" do
      feed = Feed.new(url, user)

      expect(feed.url).to eq url
    end
  end

  describe "#entries" do
    before do
      EntryFetchService.backend = FeedFixtureBackend
    end

    it "fetches entries from the feed endpoint through a service" do
      feed = Feed.new(url, user)

      entries = feed.entries

      expect(entries.count).to eq 10
      expect(entries.first[:title]).to eq "Ruby - the good parts"
    end
  end
end
