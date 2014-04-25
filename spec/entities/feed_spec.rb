require_relative '../../app/entities/feed'

describe Feed do
  let(:url) { "http://example.com/feed" }

  let(:user) { double(:user) }

  describe ".initialize" do
    it "sets the feed's endpoint URL" do
      feed = Feed.new(url, user)

      expect(feed.url).to eq url
    end
  end
end
