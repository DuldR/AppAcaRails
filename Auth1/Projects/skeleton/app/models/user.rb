class User < ApplicationRecord

    attr_reader :password

    validates :username, presence: true
    validates :session_token, presence: true
    validates :password_digest, presence: true
    validates :password, presence: { message: "Password can't be blank" }, :length => { minimum: 6 }, allow_nil: true

    before_validation :ensure_session_token

    after_initialize do |user|
        ensure_session_token
    end

    def self.find_by_credentials(username, password)
        user = User.find_by(username: username)

        return nil if user.nil?

        if user.is_password?(password)
            user
        else
            nil
        end
    end

    def self.generate_session_token
        SecureRandom::urlsafe_base64
    end

    def reset_session_token!
        self.session_token = User.generate_session_token
        self.save!
    end

    def is_password?(password)
        self.password_digest.is_password?(password)
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
