class User
  attr_reader :username

  def initialize(attrs)
    @username = attrs[:username]
  end

  def save
    UserRepo.add self

    self
  end
end
