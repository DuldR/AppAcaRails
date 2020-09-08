class TracksController < ApplicationController

    before_action :require_login

    
    def new
        @albums = Album.all
        @album = Album.find(params[:album_id])
        render :new
    end
    
    def create
        @track = Track.new(track_params)
        if @track.save!
            redirect_to album_url(track_params[:album_id])
        else
            redirect_to new_album_track_url(track_params[:album_id])
        end
    end

    def update
        @track = Track.find(params[:id])
        if @track.update_attributes(track_params)
            redirect_to track_url(@track)
        else
            redirect to edit_track_url(@track)
        end


    end
    
    def destroy
        @track = Track.find(params[:id])
        @track.destroy
        redirect_to album_url(@track.album_id)
    end

    def edit
        @track = Track.find(params[:id])
        @albums = Album.all
        render :edit
    end

    def show
        @track = Track.find(params[:id])

        render :show


    end

    def track_params
        params.require(:track).permit(:title, :ord, :bonus, :album_id, :lyrics)
    end
end