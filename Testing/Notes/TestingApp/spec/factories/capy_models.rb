FactoryBot.define do
  factory :capy do
    name { Faker::Name.name }

    color { Faker::Color.hex_color }
  end
end
