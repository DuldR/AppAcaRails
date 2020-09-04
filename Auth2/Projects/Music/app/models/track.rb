# == Schema Information
#
# Table name: tracks
#
#  id         :bigint           not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  title      :string           not null
#  ord        :integer          not null
#  lyrics     :text
#  bonus      :boolean          default(FALSE), not null
#  album_id   :integer          not null
#
class Track < ApplicationRecord
    validates :title, :ord, :album_id, presence: true
    validates :title, uniqueness: { scope: :album_id }
    validates :ord, uniqueness: { scope: :album_id }
    


end
