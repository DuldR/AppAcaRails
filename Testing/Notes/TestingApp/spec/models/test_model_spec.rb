require 'rails_helper'

RSpec.describe TestModel, type: :model do
<<<<<<< HEAD
  pending "add some examples to (or delete) #{__FILE__}"
=======
   describe "validations" do
    it "should validate presence of name" do
      test = TestModel.new(color: 'blue')
      expect(test.valid?).to be false
    end

    it "should validate presence of color"
    it "should validate uniqueness of name"
    it "should validate color is not green"
  end

  describe "associations" do
    it "should have many parties"
    it "should have many attendances"
    it "should have many parties to attend"
  end

>>>>>>> f956aea99950f4cf4af8ce96216486fd502b8e35
end
