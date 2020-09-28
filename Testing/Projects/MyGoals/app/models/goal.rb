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

STATUS_TYPES = %w(OPEN CLOSED).freeze

class Goal < ApplicationRecord
    belongs_to :user
end
