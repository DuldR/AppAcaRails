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
    it { should validate_presence_of(:username) }
    it "should validate presence of password"
    it "should validate uniquness of username"

  end

  describe "associations" do

    it "should have many goals"

  end

  describe "class methods" do

  end


  
end
