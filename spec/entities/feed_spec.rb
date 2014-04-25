require_relative '../../app/entities/feed'

describe Feed do
  let(:url) { "http://example.com/feed" }

  let(:user) { double(:user) }

  let(:feed) { Feed.new(url, user) }

  describe ".initialize" do
    it "sets the feed's endpoint URL" do
      expect(feed.url).to eq url
    end
  end

  describe "#entries" do
    it "delegates the fetching to the mapper" do
      mapper = double(:mapper)
      feed.mapper = mapper

      mapper.should_receive(:fetch).with(url)

      feed.entries
    end
  end
end
