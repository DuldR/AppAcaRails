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