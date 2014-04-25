require 'sinatra'
require_relative 'app/use_cases/create_feed'

class FeedFixtureBackend
  def self.fetch(url)
    File.open('spec/fixtures/feed_fixture.rss', 'r') do |rss|
      RSS::Parser.parse(rss).items
    end
  end
end

EntryFetchService.backend = FeedFixtureBackend

get '/' do
  feed = CreateFeed.new(url, nil).create

  @entries = feed.entries

  erb :index
end
