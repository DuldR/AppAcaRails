# == Schema Information
#
# Table name: artworks
#
#  id         :bigint           not null, primary key
#  title      :string           not null
#  image_url  :string           not null
#  artist_id  :integer          not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Artwork < ApplicationRecord
    validates :title, presence: true
    validates :title, uniqueness: { scope: :artist_id, message: "You can not have duplicate names of your pieces." }
    validates :artist_id, presence: true
    validates :image_url, presence: true
    


    belongs_to(
        :artist,
        class_name: 'User',
        foreign_key: :artist_id,
        primary_key: :id
    )

    has_many(
        :artwork_shares,
        class_name: 'ArtworkShare',
        foreign_key: :artwork_id,
        primary_key: :id,
        dependent: :destroy
    )

    has_many(
        :comments,
        class_name: 'Comment',
        foreign_key: :artwork_id,
        primary_key: :id,
        dependent: :destroy
    )

    has_many :shared_viewers, through: :artwork_shares, source: :viewer, dependent: :destroy
    
end
