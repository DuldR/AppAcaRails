class GoalsController < ApplicationController

    def create

    end

    def show

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