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
            flash.now[:errors] = "Cannot be update."
            redirect_to goal_url(params[:id])
        else
            if @goal.update_attributes(goal_params)
                redirect_to goal_url(@goal)
            else
                flash.now[:errors] = "Make sure you update correctly."
                redirect_to goal_url(@goal)
            end
        end
    end

    def destroy
        @goal = Goal.find_by(id: params[:id])

        if @goal.nil?
            flash.now[:errors] = "Not a valid goal to be deleted."
            redirect_to users_url
        else
            @goal.destroy
            redirect_to users_url
        end


    end

    private

    def goal_params
        params.require(:goal).permit(:title, :body, :user_id, :status, :is_public)
    end

end