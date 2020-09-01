class SessionsController < ApplicationController

    def new
        if current_user.nil?
            render :new
        else
            redirect_to bands_url
        end

    end

    def create

        user = User.find_by_credentials(sessions_params[:email], sessions_params[:password])
        user.reset_session_token!

        if user.nil?
            flash.alert = "User not found"
            redirect_to bands_url
        else
            login!(user)
            redirect_to bands_url
        end


    end

    def destroy
        logout!
        redirect_to bands_url
    end

    def sessions_params

        params.require(:session).permit(:email, :password)


    end

end