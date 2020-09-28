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
FactoryBot.define do
  factory :goal do
    is_public {false}
    title {"My Cool Goal"}
    body {"The Coolest Goal"}
    status {"Open"}
  end
end
