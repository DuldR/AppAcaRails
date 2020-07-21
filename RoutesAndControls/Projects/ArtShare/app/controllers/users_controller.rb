class UsersController < ApplicationController

    skip_before_action :verify_authenticity_token


    def index
        render json: params
    end

    def create

        user = User.new(user_params)
        if user.save
            render json: user
        else
            render json: user.error.full_messages, status: :unprocessable
        end
    end


    private

    def user_params
        params.require(:user).permit(:username)
    end

end