require 'rails_helper'

RSpec.describe User, type: :model do

  describe "validations" do
    it { should validate_presence_of(:email) }
    it { should validate_presence_of(:password_digest) }
    it { should validate_length_of(:password).is_at_least(6) }

  end

  describe "asssociations" do
  end

  describe "class methods" do

    #password_digest is using 'testpass' as hash
    subject(:user) { User.new(email: "coolguy420@hotmail.com", id: 1, password_digest: "$2a$12$A4A5tGfH5sd8LLUgNKosxuS2xBTLNPhLjthBf7fxfDRIvWcj7h60a", session_token: "Di0qogACCK429C_TGnHNyg") }
    
    it "#is_password?" do
      expect(user.is_password?("testpass")).to be true
      expect(user.is_password?("wrongpass")).to be false
    end


  end

end
