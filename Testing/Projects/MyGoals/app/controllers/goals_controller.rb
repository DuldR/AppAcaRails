class GoalsController < ApplicationController

    def create
        @goal = Goal.new(goal_params)

        if @goal.save == false
            flash.now[:errors] = "Could not save goal."
            redirect_to user_goals_url(params[:id])
        else
            redirect_to goal_url(@goal)
        end

    end

    def show
        render :show
    end

    def update
    end

    def delete

    end

    private

    def goal_params
        params.require(:goal).permit(:title, :body, :user_id, :status, :is_public)
    end

end