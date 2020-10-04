class FixGoalCommentTable < ActiveRecord::Migration[5.2]
  def change
    rename_column :goal_comments, :user_id, :goal_id
  end
end
