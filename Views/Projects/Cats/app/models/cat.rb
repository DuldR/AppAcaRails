# == Schema Information
#
# Table name: cats
#
#  id          :bigint           not null, primary key
#  birth_date  :date             not null
#  color       :string           not null
#  name        :string           not null
#  sex         :string(1)        not null
#  description :text
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
class Cat < ApplicationRecord
    validates :birth_date, presence: true
    validates :color, presence: true, inclusion: { in: %w(Blue Red Plaid), message: "%{value} is not a valid color"}
    validates :sex, presence: true, inclusion: { in: %w(F M A) }
    validates :name, presence: true

    has_many(
        :requests,
        class_name: "CatRentalRequest",
        foreign_key: :cat_id,
        primary_key: :id,
        dependent: :destroy
    )

    def age
        today = Date.today
        birthday = self.birth_date

        age = (today.mjd - birthday.mjd) / 365

        if age < 1
            return "about 1"
        else
            return "about #{age}"
        end

    end


end
