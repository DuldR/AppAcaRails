# == Schema Information
#
# Table name: comments
#
#  id         :bigint           not null, primary key
#  user_id    :integer          not null
#  artwork_id :integer          not null
#  body       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Comment < ApplicationRecord

    belongs_to(
        :user_comment,
        class_name: "User",
        foreign_key: :user_id,
        primary_key: :id
    )

    belongs_to(
        :artwork_comment,
        class_name: "Artwork",
        foreign_key: :artwork_id,
        primary_key: :id
    )

end
