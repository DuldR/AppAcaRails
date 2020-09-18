# == Schema Information
#
# Table name: albums
#
#  id         :bigint           not null, primary key
#  title      :string           not null
#  year       :integer          not null
#  band_id    :integer          not null
#  studio     :boolean          default(TRUE), not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Album < ApplicationRecord
    validates :studio, inclusion: { in: [true, false] }
    validates :title, :year, presence: true
    validates :title, uniqueness: true

    belongs_to :band

    has_many :tracks, dependent: :destroy


end
