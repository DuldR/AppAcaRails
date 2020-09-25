# == Schema Information
#
# Table name: users
#
#  id              :bigint           not null, primary key
#  email           :string           not null
#  password_digest :string           not null
#  session_token   :string           not null
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#

require 'bcrypt'
class User < ApplicationRecord

    attr_reader :password

    validates :email, :password_digest, :session_token, presence: true
    validates :email, uniqueness: true
    validates :password, :length => { minimum: 6, allow_nil: true}


    before_validation :ensure_session_token

    has_many :notes

    after_initialize do |user|
        ensure_session_token
    end

    def self.find_by_credentials(email, password)
        user = User.find_by(email: email)

        if user.nil?
            return nil
        end

        if user.is_password?(password)
            return user
        else
            return nil
        end
    end

    def self.generate_session_token
        SecureRandom::urlsafe_base64
    end

    def reset_session_token!
        self.session_token = User.generate_session_token
        self.save!
    end

    def password=(pass)
        @password = pass
        self.password_digest = BCrypt::Password.create(pass)
    end

    def is_password?(password)
        check = BCrypt::Password.new(password_digest)
        check.is_password?(password)

    end

    private

    def ensure_session_token
        self.session_token ||= User.generate_session_token
    end
end
