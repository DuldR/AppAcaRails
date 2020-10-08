# spec/features/comment_spec.rb

require 'spec_helper'
require 'rails_helper'

feature "comment features", type: :feature do

    subject(:user) { FactoryBot.create(:user) }
    subject(:goal) { FactoryBot.create(:goal, user_id: user.id) }
    let!(:user_comment) { Comment.create(body: "Hello user!", title: "User Comment", commentable_type: "User", commentable_id: user.id )}
    let!(:goal_comment) { Comment.create(body: "Hello goal!", title: "Goal Comment", commentable_type: "Goal", commentable_id: goal.id )}




    feature "shows user comment on page" do
        scenario "shows comment with valid params" do
            visit comment_url(user_comment.id)
            expect(page).to have_content 'Hello user!'

        end

    end

    feature "shows goal comment on page" do
        scenario "shows comment with valid params" do
 
            visit comment_url(goal_comment.id)
            expect(page).to have_content 'Hello goal!'

        end

    end

    feature "make a new user comment" do

        before(:each) do

            visit new_comment_url

            fill_in 'Add a Comment', :with => "Good user!"
            fill_in 'Title', :with => "My user comment"
            fill_in 'Id?', :with => user.id
            click_on "Create Comment"

        end

        scenario "shows user comment after inputting" do
            expect(page).to have_content "Good user!"

        end


    end

    feature "make a new goal comment" do

        before(:each) do
            visit new_comment_url

            fill_in 'body', :with => "Good goal!"
            fill_in 'Id?', :with => goal.id
            click_on "Create Comment"
        end

        scenario "shows goal comment after inputting" do
            expect(page).to have_content "Good goal!"
        end


    end

    feature "updating user comment" do

        before(:each) do
            visit edit_comment_url(user_comment)
            fill_in 'body', :with => "New user!"
            click_on "Update Comment"
        end

        scenario "shows updated user comment" do
            expect(page).to have_content "New user!"
        end


    end

    feature "updating goal comment" do

        before(:each) do
            visit edit_comment_url(goal_comment)
            fill_in 'body', :with => "New goal!"
            click_on "Update Comment"
        end

        scenario "shows updated goal comment" do
            expect(page).to have_content "New goal!"
        end


    end

    feature "deleting user comment" do

        before(:each) do
            visit user_url(user)
            click_on "Delete"
        end

        scenario "deletes user comment" do

            visit user_url(user)
            expect(page).to_not have_content "Hello user!"

        end


    end


    feature "deleting goal comment" do

        before(:each) do
            visit goal_url(goal)
            click_on "Delete"
        end

        scenario "deletes goal comment" do

            visit goal_url(goal)
            expect(page).to_not have_content "Hello goal!"

        end


    end

end