class UsersController < ApplicationController

    def index
        render :index
    end

    def show
        @user = User.find_by(id: params[:id] )

        if @user.nil? == false
            render :show
        else
            redirect_to users_url
        end

    end

    def create

    end

    private

    def user_params
        params.require(:user).permit(:username, :password)
    end
end