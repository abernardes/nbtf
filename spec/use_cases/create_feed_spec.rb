require_relative '../../app/use_cases/create_feed'

describe CreateFeed do
  let(:url) { "http://example.com/feed" }
  let(:user) { double(:user) }

  subject { CreateFeed.new(url, user) }

  it "creates feeds" do
    feed = subject.create

    expect(feed).to be_a Feed
  end

  it "sets the feed's user" do
    feed = subject.create

    expect(feed.user).to eq user
  end
end
