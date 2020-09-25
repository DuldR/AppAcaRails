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
    
    describe "#is_password?" do
      it "should return true if the correct password is given" do
        expect(user.is_password?("testpass")).to be true
        expect(user.is_password?("wrongpass")).to be false
      end
    end

    describe "#reset_session_token" do

      it "should reset the user's session token" do
        user.reset_session_token!
        expect(user.session_token).not_to eq("Di0qogACCK429C_TGnHNyg")
      end

    end

    describe "::find_by_credentials" do

      it "should find the request user object" do
        user.save!
        expect(User.find_by_credentials("coolguy420@hotmail.com", "testpass")).to eq(user)
      end

    end






  end

end
