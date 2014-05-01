require_relative '../../app/mappers/entry_fetch_mapper'
require 'pry'

class AtomFeedFixtureBackend
  def self.fetch(url)
    File.open('spec/fixtures/feed_fixture.atom', 'r') do |rss|
      RSS::Parser.parse(rss)
    end
  end
end

class FeedFixtureBackend
  def self.fetch(url)
    File.open('spec/fixtures/feed_fixture.rss', 'r') do |rss|
      RSS::Parser.parse(rss)
    end
  end
end

describe EntryFetchMapper do
  describe "#fetch" do
    it "returns an array of hashes, each of which represent an entry to the feed" do
      EntryFetchService.backend = FeedFixtureBackend

      entry = subject.fetch("http://example.com").first

      expect(entry[:author]).to eq "Author"
      expect(entry[:published_at]).to eq Time.new(2014, 4, 8, 11, 40, 33)
      expect(entry[:title]).to eq "A Guide to Choosing the Best Gems for Your Ruby Project"
      expect(entry[:content]).to include "If you need something done in Ruby, a gem for it probably exists."
      expect(entry[:url]).to eq "http://feedproxy.google.com/~r/Rubyflow/~3/2ynPljVok9U/10851-a-guide-to-choosing-the-best-gems-for-your-ruby-project"
      expect(entry[:id]).to eq "http://www.rubyflow.com/items/10851-a-guide-to-choosing-the-best-gems-for-your-ruby-project"
    end

    it "accepts both rss and atom feeds" do
      EntryFetchService.backend = AtomFeedFixtureBackend

      entry = subject.fetch("http://example.com").first

      expect(entry[:author]).to eq "John Doe"
      expect(entry[:published_at]).to eq Time.utc(2003, 12, 13, 18, 30, 02)
      expect(entry[:title]).to eq "Atom-Powered Robots Run Amok"
      expect(entry[:content]).to eq "Some interesting content."
      expect(entry[:url]).to eq "http://example.org/2003/12/13/atom03"
      expect(entry[:id]).to eq "urn:uuid:1225c695-cfb8-4ebb-aaaa-80da344efa6a"
    end
  end
end
