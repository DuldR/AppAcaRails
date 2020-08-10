class CatRentalRequestsController < ApplicationController

    def new
        @rental = CatRentalRequest.new
        @cats = Cat.all
        render :new

    end

    def create
        @rental = CatRentalRequest.new(rent_params)
        @cats = Cat.all
        if @rental.save
            redirect_to cat_url(@rental.cat_id)
        else
            render :new
        end
    end


    def approve

        @rental = CatRentalRequest.find_by(id: params[:id])
        @rental.approve!

        redirect_to cats_url
    end

    def deny
        @rental = CatRentalRequest.find_by(id: params[:id])
        @rental.deny!

        redirect_to cats_url
    end





    private

    def rent_params
        params.require(:cat_rental_request).permit(:cat_id, :start_date, :end_date, :status)

    end
end