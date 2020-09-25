# == Schema Information
#
# Table name: notes
#
#  id         :bigint           not null, primary key
#  body       :text             not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  track_id   :integer          not null
#  user_id    :integer          not null
#
class Note < ApplicationRecord

    belongs_to :user
    belongs_to :track

end
