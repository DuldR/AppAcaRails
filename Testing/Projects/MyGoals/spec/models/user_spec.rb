# == Schema Information
#
# Table name: users
#
#  id              :bigint           not null, primary key
#  username        :string           not null
#  password_digest :string           not null
#  session_token   :string           not null
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#
require 'rails_helper'

RSpec.describe User, type: :model do

  

  describe "validations" do

    subject(:user) {FactoryBot.build(:user)}
   

    it { should validate_presence_of(:username) }
    it { should validate_presence_of(:password_digest) }
    it { should validate_uniqueness_of(:username) }

  end

  describe "associations" do

    it { should have_many(:goals) }


  end

  describe "class methods" do

    subject(:user) {FactoryBot.create(:user)}

    it "should verify password is correct" do
      expect(user.is_password?("123456")).to eq(true)
      expect(user.is_password?("1")).to eq(false)

    end

    #  When testing class methods and factory bot, use subject.class to get it correctly
    # it "should find correct user using password" do
    #   user = User.new(username: "coolguy")
    #   user.password = "123456"
    #   user.save!

    #   expect(User.find_by_credentials("coolguy", "123456")).to eq(user)
    # end

    it "should find correct user using password" do

      expect(subject.class.find_by_credentials("coolguy", "123456")).to eq(user)
    end

  end


  
end
