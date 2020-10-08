class CommentsController < ApplicationController
    require 'byebug'

    def new

        @comment = Comment.new
        render :new

    end

    def edit
        @comment = Comment.find_by(id: params[:id])
        render :edit
    end

    def create
        @comment = Comment.new(comment_params)
  
        if @comment.save
            if @comment.commentable_type == "User"
                redirect_to user_url(@comment.commentable_id)
            else
                redirect_to goal_url(@comment.commentable_id)
            end
        else
            flash.now[:errors] = "Could not save comment."
            redirect_to users_url
        end

    end

    def show

        @comment = Comment.find_by(id: params[:id])
 
        if @comment.nil?
            render :status => 404
        else
            render :show
        end

    end

    def update

        @comment = Comment.find_by(id: params[:id])

        if @comment.nil?
            flash.now[:errors] = "Cannot be updated."
            redirect_to users_url
        else
            if @comment.update_attributes(comment_params)
                if @comment.commentable_type == "User"
                    redirect_to user_url(@comment.commentable_id)
                else
                    redirect_to goal_url(@comment.commentable_id)
                end
            else
                flash.now[:errors] = "Make sure you update correctly."
                redirect_to users_url
            end
        end
    end

    def destroy
        @comment = Comment.find_by(id: params[:id])

        if @comment.nil?
            flash.now[:errors] = "Not a valid Comment to be deleted."
            redirect_to users_url
        else
            @comment.destroy
            if @comment.commentable_type == "User"
                redirect_to user_url(@comment.commentable_id)
            else
                redirect_to goal_url(@comment.commentable_id)
            end
        end


    end

    private

    def comment_params
        params.require(:comment).permit(:title, :body, :commentable_type, :commentable_id)
    end

end