# == Schema Information
#
# Table name: artworks
#
#  id        :bigint           not null, primary key
#  title     :string           not null
#  image_url :string           not null
#  artist_id :integer          not null
#
class Artwork < ApplicationRecord
    validates :title, presence: true
    validates :title, uniqueness: { scope: :artist_id, message: "You can not have duplicate names of your pieces." }
    validates :artist_id, presence: true
    


    belongs_to(
        :artist,
        class_name: 'User',
        foreign_key: :artist_id,
        primary_key: :id
    )
end
