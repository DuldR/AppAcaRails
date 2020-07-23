class ArtworksController < ApplicationController

    skip_before_action :verify_authenticity_token

    def index
        # user = User.find(params[:id])

        user = User.find(params[:user_id])
        render json: user
    end

    def create
        artwork = Artwork.new(artwork_params)
        if artwork.save
            render json: artwork
        else
            render json: artwork.errors.full_messages, status: :unprocessable_entity
        end
    end

    def show
        artwork = Artwork.find(params[:id])
        render json: artwork
    end

    def update

        artwork = Artwork.update(params[:id], artwork_params)

        if artwork.save
            render json: artwork
        else
            render json: artwork.errors.full_messages, status: :unprocessable_entity
        end   
    end

    def destroy

        artwork = Artwork.find(params[:id])
        Artwork.destroy(params[:id])

        render json: artwork
    end
    

    private

    def artwork_params
        params.require(:artworks).permit(:title, :image_url, :artist_id)
    end
end