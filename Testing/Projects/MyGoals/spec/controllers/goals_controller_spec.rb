require 'rails_helper'
require 'byebug'

RSpec.describe GoalsController, type: :controller do

    
    
    describe "POST #create" do

        subject(:user) {FactoryBot.create(:user)}
        subject(:goal) {FactoryBot.create(:goal, user_id: user.id)}

        context "with invalid params" do
            it "validates for user id, body" do
                post :create, params: { goal: { title: "My favorite goal" } }
                expect(response).to redirect_to(users_url)
                expect(flash.now[:errors]).to be_present  
            end

            it "validates for status inclusion" do
                post :create, params: { goal: { user_id: 1, body: "Boy, I love this goal!", title: "My favorite goal", status: "OKGOOFFKING" } }
                expect(response).to redirect_to(users_url)
                expect(flash.now[:errors]).to be_present  
            end
        end

        context "with valid params" do

            it "redirects user to user url on success" do
                post :create, params: {  goal: { user_id: user.id, body: "Boy, I love this goal!", title: "My favorite goal", status: "OPEN", is_public: false } }
                expect(response).to redirect_to(goal_url(user.goals.last.id))
            end
            
        end
    end
    
    describe "GET #show" do


        context "with invalid params" do
            it "gives 404 if given a NG id to show" do
                get :show, params: { id: -1  }
                expect(response.status).to eq(404)
            end
        end

        context "with valid params" do
             it "gives 200 if given a GOOD id to show" do
                get :show, params: {  id: 1 }
                expect(response).to render_template('show')
            end 
        end

    end

    describe "PUT #update" do

        describe "with invalid params" do
            it "renders the goal url and gives an error with NG updates" do
                put :update, params: { id: 1, goal: { status: "NG"} }
                expect(flash.now[:errors]).to be_present
                expect(response).to redirect_to(goal_url(1))
            end
        end

        describe "with valid params" do
            it "redirects to the given id's show page" do
                put :update, params: { id: 1, goal: { status: "CLOSED"} }
                expect(response).to redirect_to(goal_url(1))
            end
        end
    end

    describe "DELETE #delete" do

        describe "with invalid params" do
            it "renders user page if NG id" do
                delete :destroy, params: { id: -1 }
                expect(flash.now[:errors]).to be_present
                expect(response).to redirect_to(users_url)
            end
        end

        describe "with valid params" do
            it "renders user page if GOOD id" do
                delete :destroy, params: { id: 1 }
                expect(response).to redirect_to(users_url)
            end
            
        end
    end
end