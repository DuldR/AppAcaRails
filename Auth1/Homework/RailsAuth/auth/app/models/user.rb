class User < ApplicationRecord

    attr_reader :password

    validates :username, presence: true
    validates :session_token, presence: true
    validates :password_digest, presence: { message: "Password can't be blank" }, :length => { minimum: 6 }, allow_nil: true
    validates :password, :length => { minimum: 6 }, allow_nil: true

    before_validation :ensure_session_token

    def self.find_by_credentials(username, pass)
        user = User.find_by(username: username)

        return user if user.password_digest.is_password?(pass)

    end

    def self.generate_session_token
        SecureRandom::urlsafe_base64
    end

    def reset_session_token!

        self.session_token = User.generate_session_token
        self.save!

    end

    def password_digest
        BCrypt::Password.new(super)
    end

    def password=(pass)
        @password = pass

        self.password_digest = BCrypt::Password.create(pass)
    end

    protected

    def ensure_session_token

        self.session_token ||= User.generate_session_token

    end
end
