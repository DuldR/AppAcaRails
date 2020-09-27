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

        before(:each) do
            visit new_session_url
            fill_in 'username', :with => "coolguy"
            fill_in 'password', :with => "123456"
            click_on "Submit"
        end

        scenario 'shows username on the homepage after login' do
            
            visit users_url
            expect(page).to have_content 'coolguy'

        end

    end

    feature 'logging out' do
        scenario 'begins with a logged out state'

        scenario 'doesn\'t show username on the
         homepage after logout'

    end
end