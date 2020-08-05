class CatRentalRequestsController < ApplicationController

    def index
        @rentals = Cat.all
        render :index

    end

    def new
        @rental = CatRentalRequest.new
        render :new
    end
end