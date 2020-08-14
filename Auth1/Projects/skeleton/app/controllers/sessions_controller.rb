class SessionsController < ApplicationController

    def new
        render :new

    end

    def create
        user = User.find_by_credentials(params[:session][:username], params[:session][:password])
        user.reset_session_token!
        @session = user.session_token

        if user.nil?
            render json: "Wrong."
        else
            render json: "Welcome back #{user.username} and your token: #{user.session_token}"
        end

    end

    def destroy

    end

    private

    def session_params
        params.require(:session).permit(:username, :password)

    end
    
end