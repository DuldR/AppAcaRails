class UserCommentsController < ApplicationController
    require 'byebug'

    def new

        @usercomment = UserComment.new
        render :new

    end

    def edit
        @usercomment = UserComment.find_by(id: params[:id])
        render :edit
    end

    def create
        @usercomment = UserComment.new(usercomment_params)

        if @usercomment.save
            redirect_to user_url(@usercomment.user_id)
        else
            flash.now[:errors] = "Could not save comment."
            redirect_to users_url
        end

    end

    def show

        @usercomment = UserComment.find_by(id: params[:id])
       
        if @usercomment.nil?
            render :status => 404
        else
            render :show
        end

    end

    def update

        @usercomment = UserComment.find_by(id: params[:id])

        if @usercomment.nil?
            flash.now[:errors] = "Cannot be updated."
            redirect_to user_comment_url(params[:id])
        else
            if @usercomment.update_attributes(usercomment_params)
                redirect_to user_url(@usercomment.user_id)
            else
                flash.now[:errors] = "Make sure you update correctly."
                redirect_to user_url(@usercomment.user_id)
            end
        end
    end

    def destroy
        @usercomment = UserComment.find_by(id: params[:id])

        if @usercomment.nil?
            flash.now[:errors] = "Not a valid usercomment to be deleted."
            redirect_to users_url
        else
            @usercomment.destroy
            redirect_to user_url(@usercomment.user_id)
        end


    end

    private

    def usercomment_params
        params.require(:user_comment).permit(:user_id, :body)
    end

end