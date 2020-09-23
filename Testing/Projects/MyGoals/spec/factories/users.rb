# == Schema Information
#
# Table name: users
#
#  id              :bigint           not null, primary key
#  username        :string           not null
#  password_digest :string           not null
#  session_token   :string           not null
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#

require 'bcrypt'

FactoryBot.define do
  factory :user do
    username {'coolguy'}
    password_digest {BCrypt::Password.create("123456")}
    @password = "123456"
    session_token {SecureRandom::urlsafe_base64}
  end
end
