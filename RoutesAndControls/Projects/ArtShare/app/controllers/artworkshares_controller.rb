class ArtworksharesController < ApplicationController

    skip_before_action :verify_authenticity_token

    def create
        share = ArtworkShare.new(share_params)
        if share.save
            render json: share
        else
            render json: share.errors.full_messages, status: :unprocessable_entity
        end

    end

    def destroy

        share = ArtworkShare.find(params[:id])
        ArtworkShare.destroy(params[:id])
        render json: share

    end


    private

    def share_params
        params.require(:shares).permit(:artwork_id, :viewer_id)
    end

end