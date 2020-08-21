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
class User < ApplicationRecord

    validates :email, :password_digest, :session_token, presence: true
    validates :email, uniqueness: true

    before_validation :ensure_session_token

    def self.generate_session_token
        SecureRandom::urlsafe_base64
    end

    def reset_session_token!
        self.session_token = User.generate_session_token
        self.save!
    end

    def password=(pass)
        @password = BCrypt::Password.create(pass)
        self.password_digest = @password
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
