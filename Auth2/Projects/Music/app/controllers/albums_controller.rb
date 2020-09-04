class AlbumsController < ApplicationController


    def edit
        @album = Album.find(params[:id])
        @bands = Band.all
        render :edit
    end

    def new
        @bands = Band.all
        @band = Band.find(params[:band_id])
        render :new
    end

    def destroy
        @album = Album.find(params[:id])
        @album.destroy
        redirect_to band_url(@album.band_id)
    end

    def update
        @album = Album.find(params[:id])

        if @album.update_attributes(album_params)
            redirect_to album_url(@album)
        else
            flash.alert = "Enter a usable name clown."
            redirect_to edit_album_url(@album)
        end
    end

    def show
        @album = Album.find(params[:id])
        @tracks = @album.tracks
        render :show
    end

    def create
        @album = Album.new(album_params)

        if @album.save!
            redirect_to album_url(@album)
        else
            redirect_to new_band_album(params[:band_id])
        end
    end



    def album_params
        params.require(:album).permit(:title, :year, :studio, :band_id)
    end
end