require_relative '../mappers/entry_fetch_mapper'

class Feed
  attr_reader :user, :url

  def initialize(url, user)
    @url, @user = url, user
  end

  def entries
    EntryFetchMapper.new(self).fetch
  end
end
