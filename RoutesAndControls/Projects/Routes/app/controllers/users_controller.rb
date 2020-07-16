class UsersController < ApplicationController

    def index
        render json: User.all
    end

    def create

        user = User.new(params.require(:user).permit(:name, :email))
        if user.save
            render json: user
        else
            render json: user.errors.full_messages, status: :unprocessable_entity
        end
    end

    def show
        # user = User.new(params.require(:user).permit(:id))

        user = User.find(params[:id])
        render json: user
    end

    def update
        # User.update(params[:id], :name => params[:name], :email => params[:email])


        User.update(params[:id], params.require(:user).permit(:name, :email))

        render json: User.find(params[:id])
    end

    def destroy

        User.destroy(params[:id])
        
    end
end