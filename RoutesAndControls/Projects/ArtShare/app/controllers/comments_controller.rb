class CommentsController < ApplicationController

    skip_before_action :verify_authenticity_token

    rescue_from ActionController::ParameterMissing, with: :show_errors


    def create
    end

    def destroy
    end

    def index
        # if comment_params[artwork_id].nil? == false
        #     artwork = Artwork.find(comment_params[artwork_id])

        # render json: Artwork.find(comment_params)
        # if comment_params
        # elsif comment_params.has_key?(:user_id)
        #     comments = Comment.where(user_id: comment_params[:user_id])
        # elsif comment_params.has_key?(:artwork_id)
        #     comments = Comment.where(artwork_id: comment_params[:artwork_id])
        # else
        #     render json: comments.errors_full_messages, status: :bad_request
        # end

        # if comment_params.nil?
        #     render json: {
        #         error: "Enter a userid or artworkid",
        #         status: 400
        #     }, status: :bad_request
        # end

        if comment_params.permitted? == false
            render json: {status: :bad_request}
        end

    
    
    end

    private

    def comment_params
        params.require(:comments).permit(:artwork_id, :user_id)
    end

    def show_errors
        render json: {status: "Enter a userid or artworkid"}
    end
end