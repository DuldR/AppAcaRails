class SessionsController < ApplicationController

    def new
        render :new

    end

    def create
        @user = User.new(session_params)

        render json: @user
        # if @user.save
        #     redirect_to cats_url
        # else
        #     render :new
        # end

    end

    def destroy

    end

    private

    def session_params
        params.require(:session).permit(:username, :password)

    end
    
end