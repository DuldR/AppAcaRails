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
        @user = User.new(user_params)

        if @user.save == false
            render :index
        else
            redirect_to user_url(@user.id)
        end

    end

    private

    def user_params
        params.require(:user).permit(:username, :password)
    end
end