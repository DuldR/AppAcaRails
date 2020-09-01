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
        # @band = Band.find(params[:id])
        # @band.update(name: params[:name])

        # @band.save!

        render params[:name]
    end

    def destroy

    end

    def show
        @band = Band.find_by(id: params[:id])
        render :show
    end

    def create

    end

    def user_params
        params.require(:bands).permit(:name)
    end
end