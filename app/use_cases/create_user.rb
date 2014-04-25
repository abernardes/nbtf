require_relative '../entities/user'

class CreateUser
  def initialize(user_form)
    @user_form = user_form
  end

  def create
    user = User.new({
      username: user_form.username
    })

    user.save
  end

  private

  attr_reader :user_form
end

class UserRepo
  @@users = []

  def self.count
    @@users.length
  end

  def self.add(user)
    @@users << user
  end

  def self.clear
    @@users = []
  end
end
