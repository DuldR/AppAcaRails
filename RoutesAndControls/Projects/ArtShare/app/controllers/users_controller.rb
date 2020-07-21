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

    def show
        user = User.find(params[:id])
        render json: user
    end

    def update

        user = User.update(params[:id], user_params)

        if user.save
            render json: user
        else
            render json: user.errors.full_messages, status: :unprocessable_entity
        end        

    end

    def destroy
        user = User.find(params[:id])
        User.destroy(params[:id])

        render json: user
    end



    private

    def user_params
        params.require(:user).permit(:username)
    end

end