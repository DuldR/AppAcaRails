# == Schema Information
#
# Table name: user_comments
#
#  id         :bigint           not null, primary key
#  body       :string           not null
#  user_id    :integer          not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class UserComment < ApplicationRecord
    
    validates :body, presence: true
    validates :user_id, presence: true

    belongs_to :user

end
