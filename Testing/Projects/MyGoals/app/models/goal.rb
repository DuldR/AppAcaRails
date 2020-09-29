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

    validates :body, :user_id, :title, presence: true
    validates :status, inclusion: { in: %w(OPEN CLOSED) }
    belongs_to :user



    def complete?
        return false if self.status == "OPEN"
    end

    def make_private
        self.is_public = false
    end

    def closed
        self.status = "CLOSED"
    end
end
