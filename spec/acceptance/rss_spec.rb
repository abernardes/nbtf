require_relative '../spec_helper'

class FeedFixtureBackend
  def self.fetch(url)
    File.open('spec/fixtures/feed_fixture.rss', 'r') do |rss|
      RSS::Parser.parse(rss).items
    end
  end
end

EntryFetchService.backend = FeedFixtureBackend

describe "Loading feed data" do
  it "Loads data from a feed URL" do
    visit '/'
    fill_in "feed_url", :with => "http://example.com/feed"
    click_button "Funk it"

    expect(page).to have_content "Ruby - the good parts"
  end
end
