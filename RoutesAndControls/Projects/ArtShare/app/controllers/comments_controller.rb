class CommentsController < ApplicationController

    skip_before_action :verify_authenticity_token

    rescue_from ActionController::ParameterMissing, with: :show_errors


    def create
        comment = Comment.new(comment_params)
        if comment.save
            render json: comment
        else
            render json: comment.errors.full_messages, status: :unprocessable_entity
        end
    end

    def destroy
        comment = Comment.find(params[:id])
        Comment.destroy(params[:id])
        render json: comment
    end

    def index
        if comment_params.has_key?(:user_id)
            comments = Comment.where(user_id: comment_params[:user_id])
        elsif comment_params.has_key?(:artwork_id)
            comments = Comment.where(artwork_id: comment_params[:artwork_id])
        end


        render json: comments
    end

    private

    def comment_params
        params.require(:comments).permit(:artwork_id, :user_id)
    end

    def show_errors
        render json: {status: "Enter a userid or artworkid"}
    end
end