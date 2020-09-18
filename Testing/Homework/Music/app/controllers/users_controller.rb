class UsersController < ApplicationController
    
    def create
        @user = User.new(user_params)
        @user.password = user_params[:password]

        if @user.save!
            login!(@user)
            render :new
        else
            render :json => { :errors => @user.errors.full_messages }
        end
    end

    def new
        @user = User.new
        render :new
    end

    private

    def user_params
        params.require(:user).permit(:email, :password)
    end
end