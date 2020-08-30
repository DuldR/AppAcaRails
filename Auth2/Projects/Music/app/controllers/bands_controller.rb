class BandsController < ApplicationController

    def index
        @bands = Band.all
        render :index

    end

    def edit

    end

    def new

    end

    def update
    end

    def destroy

    end

    def show
        @band = Band.find_by(id: params[:id])
        render :show
    end

    def create

    end
end