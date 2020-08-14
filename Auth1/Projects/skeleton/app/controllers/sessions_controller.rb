class SessionsController < ApplicationController

    def new
        if !current_user.nil?
            redirect_to cats_url
        else
            render :new
        end

    end

    def create
        user = User.find_by_credentials(params[:session][:username], params[:session][:password])
        user.reset_session_token!

        if user.nil?
            redirect_to new_session_url
        else
            login!(user)
            redirect_to cats_url
        end

    end

    def destroy
        logout!
        redirect_to new_session_url

    end

    private

    def session_params
        params.require(:session).permit(:username, :password)

    end
    
end