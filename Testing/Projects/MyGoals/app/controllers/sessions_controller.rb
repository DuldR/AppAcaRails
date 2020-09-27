class SessionsController < ApplicationController

    def new
        if current_user.nil?
            render :new
        else
            redirect_to users_url
        end

    end

    def create

        @user = User.find_by_credentials(sessions_params[:username], sessions_params[:password])
        @user.reset_session_token!

        
        if @user.nil? == true
            flash.alert = "User not found"
            redirect_to users_url
        else
            login!(@user)
            redirect_to users_url
        end
    end

    def destroy
        logout!
        redirect_to users_url
    end

    def sessions_params

        params.require(:session).permit(:username, :password)


    end

end