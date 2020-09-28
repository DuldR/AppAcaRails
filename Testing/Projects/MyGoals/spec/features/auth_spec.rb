# spec/features/auth_spec.rb

require 'spec_helper'
require 'rails_helper'

feature "user features", type: :feature do

    feature 'the signup process' do
        scenario 'has a new user page' do
            visit new_user_url
            expect(page).to have_content 'Sign Up!'
        end
    end

    feature 'signing up a user' do

        before(:each) do
            visit new_user_url
            fill_in 'username', :with => "coolguy"
            fill_in 'password', :with => "123456"
            click_on "Submit"
        end

        scenario 'shows username on the homepage after signup' do

            expect(page).to have_content 'coolguy'

        end

    end


    feature 'logging in' do

        subject(:user) {FactoryBot.create(:user)}
        

        before(:each) do

            user.save!

            visit new_session_url
            fill_in 'username', :with => "coolguy"
            fill_in 'password', :with => "123456"
            click_on "Submit"

        end

        scenario 'shows username on the homepage after login' do
            
            expect(page).to have_content 'coolguy'

        end

    end

    feature 'logging out' do

        subject(:user) {FactoryBot.create(:user)}
        

        before(:each) do

            user.save!

            visit new_session_url
            fill_in 'username', :with => "coolguy"
            fill_in 'password', :with => "123456"
            click_on "Submit"

        end

        scenario 'begins with a logged out state' do
            expect(page).to have_selector(:link_or_button, "Logout")
        end

        scenario 'doesn\'t show username on the homepage after logout' do
            click_on "Logout"
            expect(page).to have_no_content("coolguy")
        end

    end
end