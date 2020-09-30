require 'rails_helper'

RSpec.describe GoalsController, type: :controller do

    subject(:user) {FactoryBot.create(:user)}
    subject(:goal) {FactoryBot.create(:goal)}
    
    describe "POST #create" do
        context "with invalid params" do
            it "validates for user id, body" do
                post :create, params: { user_id: 1, goal: { title: "My favorite goal" } }
                expect(response).to redirect_to(user_goals_url(user))
                expect(flash.now[:errors]).to be_present  
            end

            it "validates for status inclusion" do
                post :create, params: { goal: { user_id: 1, body: "Boy, I love this goal!", title: "My favorite goal", status: "OKGOOFFKING" } }
                expect(response).to redirect_to(goal_url(goal))
                expect(flash.now[:errors]).to be_present  
            end
        end

        context "with valid params" do
            it "redirects user to user url on success" do
                post :create, params: { goal: { user_id: 1, body: "Boy, I love this goal!", title: "My favorite goal", status: "OPEN" } }
                expect(response).to redirect_to(user_url(1))
            end
            
        end
    end
    
    describe "GET #show" do


        context "with invalid params" do
            it "gives 404 if given a NG id to show" do
                get :show, params: { goal: { id: -1 } }
                expect(response.status).to eq(404)
            end
        end

        context "with valid params" do
             it "gives 200 if given a GOOD id to show" do
                get :show, params: { goal: { id: 1 } }
                expect(response.status).to eq(200)
            end 
        end

    end

    describe "PUT #update" do

        describe "with invalid params" do
            it "renders the goal url and gives an error with NG updates" do
                put :update, params: { goal: { id: 1, status: "NG"} }
                expect(response).to render_template('edit')
                expect(flash.now[:errors]).to be_present
            end
        end

        describe "with valid params" do
            it "redirects to the given id's show page" do
                put :update, params: { goal: { id: 1, status: "CLOSED"} }
                expect(response).to redirect_to(goal_url(1))
            end
        end
    end

    describe "DELETE #delete" do

        describe "with invalid params" do
            it "renders user page if NG id" do
                delete :delete, params: { goal: { id: -1 } }
                expect(response).to render_template('show')
                expect(flash.now[:errors]).to be_present
            end
        end

        describe "with valid params" do
            it "renders user page if GOOD id" do
                delete :delete, params: { goal: { id: 1 } }
                expect(response).to redirect_to(user_url(1))
            end
            
        end
    end
end