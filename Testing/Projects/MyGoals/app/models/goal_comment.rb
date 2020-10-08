# == Schema Information
#
# Table name: goal_comments
#
#  id         :bigint           not null, primary key
#  body       :string           not null
#  goal_id    :integer          not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class GoalComment < ApplicationRecord
    
    validates :body, presence: true
    validates :goal_id, presence: true

    belongs_to :goal
    has_many :goal_comments

end
