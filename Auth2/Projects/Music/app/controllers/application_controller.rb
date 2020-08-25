class ApplicationController < ActionController::Base

    helper_method :current_user


    def login!(user)
        @current_user = user
        fail
        session[:session_token] = user.session_token

    end

    def logged_in?

    end

    def logout

    end

    def current_user
        return nil if @current_user = nil
        @current_user ||= User.find_by(session_token: params[:session_token])
    end
end
