require 'rails_helper'

RSpec.describe Capy, type: :model do
   describe "validations" do
    # it "should validate presence of name" do
    #   capy = Capy.new(color: 'blue')
    #   expect(capy.valid?).to be false
    # end

    subject(:capy) { Capy.new(name: "Anus", color: "Brown") }

    #With a shoulda matcher

    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:color) }
    it { should validate_uniqueness_of(:name) }

    it "should validate presence of color"
    it "should validate uniqueness of name"
    it "should validate color is not green"
  end

  describe "associations" do
    it { should have_many(:parties) }
    it { should have_many(:attendances) }
    it { should have_many(:parties_to_attend) }
    it "should have many attendances"
    it "should have many parties to attend"
  end

end
