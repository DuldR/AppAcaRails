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
  end

  describe "class methods" do

  end


end
