require 'rails_helper'

RSpec.describe UsersController, type: :controller do



    describe "GET #show" do
        it "render the show template" do
            user = User.new(username: "coolguy")
            user.password = "123456"
            user.save!

            get :show, params: { id: user.id }
            expect(response).to render_template(:show)
        end

        context "if the user does not exist" do
            it "is not a success" do
                begin
                    get :show, params: { id: -1 }
                rescue
                    ActiveRecord::RecordNotFound
                end

                expect(response).not_to render_template(:show)
            end

        end
        
    end

    describe "GET #index" do
        it "renders the users index" do
            get :index
            expect(response).to be_success
            expect(response).to render_template(:index)
        end
    end


    describe "POST #create" do
        context "with invalid params" do
            it "renders the new template" do
                post :create, params: { user: {username: "coolguy" } }
                expect(response).to render_template(:new)

            end
        end

        context "with valid params" do

            it "redirects to new user url" do
                post :create, params: { user: { username: "coolguy", password: "123456" } }
                expect(response).to redirect_to(user_url(User.find_by(username: "coolguy")))
            end
        end
    end
end