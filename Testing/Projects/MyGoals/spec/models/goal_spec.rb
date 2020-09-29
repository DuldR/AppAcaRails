# == Schema Information
#
# Table name: goals
#
#  id         :bigint           not null, primary key
#  body       :string           not null
#  user_id    :integer          not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  title      :string           not null
#  is_public  :boolean          default(FALSE)
#  status     :string           not null
#
require 'rails_helper'

RSpec.describe Goal, type: :model do

  describe "validations" do

    subject(:goal) {FactoryBot.build(:goal)}

    #According to shoulda matchers, it's not feasible to test the boolean.

    it { should validate_inclusion_of(:status).in_array(%w(OPEN CLOSED)) }
    it { should validate_presence_of(:user_id) }
    it { should validate_presence_of(:title) }
    it { should validate_presence_of(:body) }

    
  end


  describe "associatons" do

    it { should belong_to(:user) }
  end

  describe "class methods" do
    subject(:goal) {FactoryBot.build(:goal)}

    describe "#make_private" do
      it "should be private before testing" do
        expect(goal.is_public).to be true
      end

      it "should set the goal to private" do
        goal.make_private
        expect(goal.is_public).to be false
      end

    end

    describe "#complete?" do
      it "should return true if closed" do
        expect(goal.complete?).to be false
      end
    end

    describe "#closed" do
      it "set the goal as closed" do
        goal.closed
        expect(goal.status).to eq("CLOSED")
      end

    end



  end


end
