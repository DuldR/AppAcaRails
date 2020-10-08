class GoalCommentsController < ApplicationController
    require 'byebug'

    def new

        @goalcomment = GoalComment.new
        render :new

    end

    def edit
        @goalcomment = GoalComment.find_by(id: params[:id])
        render :edit
    end

    def create
        @goalcomment = GoalComment.new(goalcomment_params)
  
        if @goalcomment.save
            redirect_to goal_url(@goalcomment.goal_id)
        else
            flash.now[:errors] = "Could not save comment."
            redirect_to users_url
        end

    end

    def show

        @goalcomment = GoalComment.find_by(id: params[:id])
 
        if @goalcomment.nil?
            render :status => 404
        else
            render :show
        end

    end

    def update

        @goalcomment = GoalComment.find_by(id: params[:id])

        if @goalcomment.nil?
            flash.now[:errors] = "Cannot be updated."
            redirect_to goal_comment_url(params[:id])
        else
            if @goalcomment.update_attributes(goalcomment_params)
                redirect_to goal_url(@goalcomment.goal_id)
            else
                flash.now[:errors] = "Make sure you update correctly."
                redirect_to goal_url(@goalcomment.goal_id)
            end
        end
    end

    def destroy
        @goalcomment = GoalComment.find_by(id: params[:id])

        if @goalcomment.nil?
            flash.now[:errors] = "Not a valid GoalComment to be deleted."
            redirect_to goals_url
        else
            @goalcomment.destroy
            redirect_to goal_url(@goalcomment.goal_id)
        end


    end

    private

    def goalcomment_params
        params.require(:goal_comment).permit(:goal_id, :body)
    end

end