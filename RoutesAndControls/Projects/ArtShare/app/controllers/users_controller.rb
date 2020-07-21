class UsersController < ApplicationController

    skip_before_action :verify_authenticity_token


    def index
        render json: User.all
    end

    def create

        user = User.new(user_params)
        if user.save
            render json: user
        else
            render json: user.errors.full_messages, status: :unprocessable_entity
        end
    end

    def destroy
        User.destroy(params[:id])
    end



    private

    def user_params
        params.require(:user).permit(:username)
    end

end