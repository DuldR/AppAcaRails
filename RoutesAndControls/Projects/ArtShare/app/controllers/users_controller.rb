class UsersController < ApplicationController

    skip_before_action :verify_authenticity_token


    def index
        if user_params.has_key?(:username)
            user = User.where("username LIKE ?", user_params[:username])
            if user.empty?
                render json: {status: :bad_request}
            else
                render json: user
            end
        else
            render json: User.all
        end

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