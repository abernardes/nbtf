require_relative '../mappers/entry_fetch_mapper'

class Feed
  attr_reader :user, :url
  attr_writer :mapper

  def initialize(url, user)
    @url, @user = url, user
  end

  def entries
    mapper.fetch(url)
  end

  private

  def mapper
    @mapper || EntryFetchMapper.new
  end
end
