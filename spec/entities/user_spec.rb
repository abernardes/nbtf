require_relative '../../app/entities/user'
describe User do
  describe "initialize" do
    it "sets the user attributes based on the params hash" do
      user = User.new({
        username: "johndoe"
      })

      expect(user.username).to eq "johndoe"
    end
  end
end
