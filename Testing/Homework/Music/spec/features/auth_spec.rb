feature "the signup process" do

    scenario "has a new user page" do
        visit new_user_url
        expect(page).to have_content "Let's Sign Up!"

    end
    
    feature "signing up a user" do
        before(:each) do
            visit new_user_url
            fill_in 'email', :with => "coolguy420@hotmail.com"
            fill_in 'password', :with => "smokeweed"
            click_on "Submit"
        end

        scenario "redirect to bands page index after signup" do
            expect(page).to have_content 'Band Index'
        end

    end


    feature "with an invalid user" do
        before(:each) do
            visit new_user_url
            fill_in 'Email', :with => "testing@email.com"
            click_on "Submit"

        end

        scenario "re-renders the signup page after failed signup" do
            expect(page).to have_content "Let's Sign Up!"
        end
    end



end