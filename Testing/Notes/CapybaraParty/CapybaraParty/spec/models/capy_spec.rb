# == Schema Information
#
# Table name: capys
#
#  id         :integer          not null, primary key
#  name       :string           not null
#  color      :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
require 'rails_helper'

RSpec.describe Capy, type: :model do
  # What to test?
  #   Validations
  #   Associations
  #   Class Methods
  #   Error Messages

  # subject(:capy) { Capy.new(name: 'carlo', color: 'yellow') }

  # Test For:
  # Validations
  # Associations
  # Class Methods
  # Error Messages


  describe "validations" do
    it "should validate presence of name"
    it "should validate presence of color"
    it "should validate uniqueness of name"
    it "should validate color is not green"
  end

  describe "associations" do
    it "should have many parties"
    it "should have many attendances"
    it "should have many parties to attend"
  end

  describe "class methods" do
    describe "::capys_of_the_rainbow" do
      it "should return all capys of color rainbow"
    end

  end




end




