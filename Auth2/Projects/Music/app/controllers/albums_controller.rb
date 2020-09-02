class AlbumsController < ApplicationController

    def index
        @albums = Album.all
        render :index
    end

    def edit
    end

    def new
        render :index
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