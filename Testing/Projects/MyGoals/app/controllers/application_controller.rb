class ApplicationController < ActionController::Base

    helper_method :require_login
    helper_method :current_user

    def require_login

  
        unless logged_in?
            redirect_to new_user_url
        end
    end


    def login!(user)
        @current_user = user
        session[:session_token] = user.session_token

    end

    def logged_in?
        return true if !session[:session_token].nil?
    end

    def logout!
        current_user.try(:reset_session_token!)
        session[:session_token] = nil
    end

    def current_user
        return nil if session[:session_token].nil?
        @current_user ||= User.find_by(session_token: self.session[:session_token])

    end
end
