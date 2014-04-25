require_relative '../entities/feed'

class CreateFeed
  def initialize(url, user)
    @url, @user = url, user
  end

  def create
    Feed.new(@url, @user)
  end
end
