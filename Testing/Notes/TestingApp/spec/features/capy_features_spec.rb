require 'rails_helper'


feature "capybara features", type: :feature do
    feature "making a new capybara" do
        # before(:each) do
        #     visit "/capys/new"
        # end

        scenario "with invalid params" do
            # fill_in "name", with: "pam"
            # click_on "Create Capy"

            create_capy("pam", nil)
            expect(current_path).to eq("/capys")
            expect(page).to have_content("Color can't be blank")

        end

        scenario "with valid params" do

            # fill_in "name", with: "pam"
            # fill_in "color", with: "pink"
            # click_on "Create Capy"

            # save_and_open_page

            create_capy("pam", "pink")
            expect(page).to have_content("pam")
            expect(current_path).to eq("/capys/#{Capy.find_by(name: "pam").id}")


        end
    end

end