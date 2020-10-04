class GoalsController < ApplicationController
    require 'byebug'

    def create
        @goal = Goal.new(goal_params)
    
        if @goal.save
            redirect_to goal_url(@goal)
        else
            flash.now[:errors] = "Could not save goal."
            redirect_to users_url
        end

    end

    def show
        @goal = Goal.find_by(id: params[:id])
        
        if @goal.nil?
            render :status => 404
        else
            render :show
        end

    end

    def update
        @goal = Goal.find_by(id: params[:id])

        if @goal.nil?
            flash.now[:errors] = "Enter a usable name clown."
            redirect_to goal_url(params[:id])
        else
            @goal.update_attributes(goal_params)
            redirect_to goal_url(@goal)
        end
    end

    def delete

    end

    private

    def goal_params
        params.require(:goal).permit(:title, :body, :user_id, :status, :is_public)
    end

end