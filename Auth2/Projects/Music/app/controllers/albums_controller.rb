class AlbumsController < ApplicationController

    def index
        @albums = Album.all
        render :index
    end

    def edit
    end

    def new
        @bands = Band.all
        @band = Band.find(params[:band_id])
        render :new
    end

    def destroy
    end

    def update
        @album = Album.find(params[:id])

        if @album.update_attributes(band_params)
            redirect_to band_url(@band)
        else
            flash.alert = "Enter a usable name clown."
            redirect_to edit_band_url(@band)
        end
    end

    def show
        @album = Album.find(params[:id])
        render :show
    end

    def create
    end



    def album_params
        params.require(:album).permit(:title, :year, :studio, :band_id)
    end
end