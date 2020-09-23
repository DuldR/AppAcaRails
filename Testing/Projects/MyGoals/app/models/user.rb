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


class User < ApplicationRecord

    attr_reader :password

    validates :username, presence: true, uniqueness: true
    validates :password_digest, presence: true
    validates :password, presence: { message: "Password can't be blank" }, :length => { minimum: 6 }, allow_nil: true


    def self.find_by_credentials(username, password)

        user = User.find_by(username: username)

        return nil if user.nil?

        if user.is_password?(password)
            user
        else
            nil
        end


    end

    def is_password?(pass)
        check = BCrypt::Password.new(password_digest)
        check.is_password?(pass)
    end

    


    def password=(pass)
        @password = pass
        self.password_digest = BCrypt::Password.create(pass)
    end


end
