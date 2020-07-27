class CommentsController < ApplicationController

    skip_before_action :verify_authenticity_token


    def create
    end

    def destroy
    end

    def index
        # if comment_params[artwork_id].nil? == false
        #     artwork = Artwork.find(comment_params[artwork_id])

        # render json: Artwork.find(comment_params)

        if comment_params.has_key?(:user_id)
            comments = Comment.where(user_id: comment_params[:user_id])
        end




        render json: comments
    
    
    end

    private

    def comment_params
        params.require(:comments).permit(:artwork_id, :user_id)
    end
end