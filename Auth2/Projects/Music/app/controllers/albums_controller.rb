class AlbumsController < ApplicationController

    def index
        @albums = Album.all
        render :index
    end

    def edit
    end

    def new
        @bands = Band.all
        render :new
    end

    def destroy
    end

    def update
    end

    def show
    end

    def create
    end

end