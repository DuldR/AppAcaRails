class SessionsController < ApplicationController

    def new
        if @current_user.nil?
            render :new
        else
            redirect_to new_user_url
        end

    end

    def create

    end

    def destroy

    end

end