class BandsController < ApplicationController

    before_action :require_login


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

        if @band.update_attributes(band_params)
            redirect_to band_url(@band)
        else
            flash.alert = "Enter a usable name clown."
            redirect_to edit_band_url(@band)
        end
    end

    def destroy
        @band = Band.find(params[:id])
        @band.destroy
        redirect_to bands_url
    end

    def show
        @band = Band.find_by(id: params[:id])
        @albums = @band.albums
        render :show
    end

    def create
        @band = Band.new(band_params)
        @band.save!
        redirect_to bands_url

    end

    def band_params
        params.require(:band).permit(:name)
    end
end