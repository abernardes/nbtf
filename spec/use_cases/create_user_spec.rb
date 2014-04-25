require_relative '../../app/use_cases/create_user'

describe CreateUser do
  before do
    UserRepo.clear
  end

  it "creates a new user with the form attributes" do
    user_form = double(:user_form, username: "johndoe")

    create_user = CreateUser.new(user_form)
    user = create_user.create

    expect(user.username).to eq "johndoe"
  end

  it "saves the new user" do
    user_form = double(:user_form, username: "johndoe")

    create_user = CreateUser.new(user_form)
    user = create_user.create

    expect(UserRepo.count).to eq 1
  end
end
