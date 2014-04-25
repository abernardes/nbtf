require 'sinatra'
require_relative 'app/use_cases/create_feed'

EntryFetchService.backend = EntryFetchService::FeedSiteBackend

get '/' do
  erb :index
end

post '/feed' do
  url = params[:feed_url]

  binding.pry
  feed = CreateFeed.new(url, nil).create

  @entries = feed.entries

  erb :index
end
