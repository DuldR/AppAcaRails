class User < ApplicationRecord
    validates :username, presence: true
    validates :session_token, presence: true
    validates :password_digest, presence: { message: "Password can't be blank" }, :length => { minimum: 6 }, allow_nil: true

    before_validation :ensure_session_token


    protected

    def ensure_session_token

        self.session_token ||= SecureRandom.hex(8)

    end
end
