class BandsController < ApplicationController

    def index
        @bands = Band.all
        render :index

    end

    def edit
        @band = Band.find(params[:id])
        render :edit

    end

    def new
        @band = Band.new
        render :new

    end

    def update
        @band = Band.find(params[:id])
        @band.update(band_params)
        @band.save!
    end

    def destroy

    end

    def show
        @band = Band.find_by(id: params[:id])
        render :show
    end

    def create

    end

    def band_params
        params.require(:band).permit(:name)
    end
end