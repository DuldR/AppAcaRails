class TestModel < ApplicationRecord
<<<<<<< HEAD
=======

  validates :name, :color, presence: true
  validates :name, uniqueness: true
  validate :color_not_green

  has_many :parties, inverse_of: :capy
  has_many :attendances
  has_many :parties_to_attend, through: :attendances, source: :party

  def self.capys_of_the_rainbow
    Capy.where(color: 'rainbow')
  end

  def color_not_green
    errors[:color] << "cannot be green!!" if color == 'green'
  end
>>>>>>> f956aea99950f4cf4af8ce96216486fd502b8e35
end
