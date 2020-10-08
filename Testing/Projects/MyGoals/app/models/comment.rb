# == Schema Information
#
# Table name: comments
#
#  id               :bigint           not null, primary key
#  title            :string           not null
#  body             :string           not null
#  commentable_type :string
#  commentable_id   :bigint
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#
class Comment < ApplicationRecord
    include Commentable

    validates :body, :title, presence: true

    

    belongs_to :commentable, polymorphic: true


end
