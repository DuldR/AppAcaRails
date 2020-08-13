class SessionsController < ApplicationController

    def new
        render :new

    end

    def create
        user = User.find_by_credentials(params[:session][:username], params[:session][:password])

        if user.nil?
            render json: "Wrong."
        else
            render json: "Welcome back #{user.username}"
        end

    end

    def destroy

    end

    private

    def session_params
        params.require(:session).permit(:username, :password)

    end
    
end