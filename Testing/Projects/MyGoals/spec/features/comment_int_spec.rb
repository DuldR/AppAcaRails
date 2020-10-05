# spec/features/comment_spec.rb

require 'spec_helper'
require 'rails_helper'

feature "comment features", type: :feature do

    subject(:user) { FactoryBot.create(:user) }
    subject(:goal) { FactoryBot.create(:goal, user_id: user.id) }
    subject(:user_comment) { UserComment.create(body: "Hello user!", user_id: user.id, )}
    subject(:goal_comment) { GoalComment.create(body: "Hello goal!", goal_id: goal.id, )}

    feature "shows user comment on page" do
        scenario "shows comment with valid params" do
            visit user_comment_url(user_comment.id)
            expect(page).to have_content 'Hello user!'

        end

    end

    feature "shows goal comment on page" do
        scenario "shows comment with valid params" do
            visit goal_comment_url(goal_comment.id)
            expect(page).to have_content 'Hello goal!'

        end

    end

    feature "make a new user comment" do

        before(:each) do

            visit new_user_comment_url

            fill_in 'body', :with => "Good user!"
            fill_in 'user', :with => "1"
            click_in "Submit"

        end

        scenario "shows user comment after inputting" do

            visit user_url(1)
            expect(page).to have_content "Good user!"

        end


    end

    feature "updating comment" do

        scenario "shows updated comment" do

        end


    end

    feature "deleting comment" do

        scenario "deletes comment" do

        end


    end

end