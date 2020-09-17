require 'rails_helper'

RSpec.describe Capy, type: :model do
   describe "validations" do
    # it "should validate presence of name" do
    #   capy = Capy.new(color: 'blue')
    #   expect(capy.valid?).to be false
    # end

    # subject(:capy) { Capy.new(name: "Anus", color: "Brown") }

    subject(:capy) {FactoryBot.build(:capy) }
    #With a shoulda matcher

    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:color) }
    it { should validate_uniqueness_of(:name) }

    it "should validate color is not green" do
      # green_capy = Capy.new(name: "Dev", color: "green")
      
      green_capy = FactoryBot.build(:capy, color: "green" )
      # FactoryBot.create to save instance to DB
      green_capy.valid?

      expect(green_capy.errors[:color]).to eq(["cannot be green!!"])
    end
  end

  describe "associations" do
    it { should have_many(:parties) }
    it { should have_many(:attendances) }
    it { should have_many(:parties_to_attend) }
  end

  describe "class methods" do
    describe "::capys_of_the_rainbow" do
      it "should return all capys of color rainbow" do
        # Active Record Testing
        # rainbow = Capy.create(name: "rainbow", color: "rainbow")
        # not_rainbow = Capy.create(name: "not a rainbow", color: "sparkels")

        # expect(Capy.capys_of_the_rainbow).to include(rainbow)
        # expect(Capy.capys_of_the_rainbow).not_to include(not_rainbow)

        expect(Capy.capys_of_the_rainbow.where_values_hash).to eq("color" => "rainbow")

      end

    end

  end

end
