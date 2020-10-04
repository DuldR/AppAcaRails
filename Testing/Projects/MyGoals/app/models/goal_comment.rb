class GoalComment < ApplicationRecord
    
    validates :body, presence: true
    validates :goal_id, presence: true

    belongs_to :goal

end
