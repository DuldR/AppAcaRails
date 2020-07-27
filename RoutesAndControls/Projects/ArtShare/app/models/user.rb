# == Schema Information
#
# Table name: users
#
#  id         :bigint           not null, primary key
#  username   :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class User < ApplicationRecord
    validates :username, presence: true
    validates :username, uniqueness: true

    has_many(
        :pieces,
        class_name: "Artwork",
        foreign_key: :artist_id,
        primary_key: :id,
        dependent: :destroy
    )

    has_many(
        :user_shares,
        class_name: 'ArtworkShare',
        foreign_key: :artwork_id,
        primary_key: :id,
        dependent: :destroy
    )

    has_many(
        :share_receive,
        class_name: 'ArtworkShare',
        foreign_key: :viewer_id,
        primary_key: :id,
        dependent: :destroy
    )

    has_many(
        :comments,
        class_name: 'Comment',
        foreign_key: :user_id,
        primary_key: :id,
        dependent: :destroy
    )
    
    has_many :shared_artworks, through: :user_shares, source: :artwork, dependent: :destroy
    has_many :shared_received, through: :share_receive, source: :artwork, dependent: :destroy
    


end
