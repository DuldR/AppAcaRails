class CatRentalRequestsController < ApplicationController

    def index
        @rentals = CatRentalRequest.all
        render :index
    end
end