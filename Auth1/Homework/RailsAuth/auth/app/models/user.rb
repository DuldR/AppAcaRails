class User < ApplicationRecord
    validates :username, presence: true
    validates :session_token, presence: true
    validates :password_digest, presence: { message: "Password can't be blank" }, :length => { minimum: 6 }, allow_nil: true

    before_validation :ensure_session_token

    def self.find_by_credentials(username, pass)
        self.where("username = ? AND password_digest = ?", username, pass)

    end

    def self.generate_session_token
        SecureRandom::urlsafe_base64
    end

    protected

    def ensure_session_token

        self.session_token ||= User.generate_session_token

    end
end
