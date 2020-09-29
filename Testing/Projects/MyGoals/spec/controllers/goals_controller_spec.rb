require 'rails_helper'

RSpec.describe GoalsController, type: :controller do
    
    describe "POST #create" do
        context "with invalid params" do
            it "validates for user id, body" do
                post :create, params: { goal: { title: "My favorite goal" } }
                expect(response).to render_template('new')
                expect(flash.now[:errors]).to be_present  
            end

            it "validates for status inclusion" do
                post :create, params: { goal: { user_id: 1, body: "Boy, I love this goal!", title: "My favorite goal", status: "OKGOOFFKING" } }
                expect(response).to render_template('new')
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

        subject(:user) {FactoryBot.create(:user)}
        subject(:goal) {FactoryBot.create(:goal)}


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

        subject(:user) {FactoryBot.create(:user)}
        subject(:goal) {FactoryBot.create(:goal)}

        describe "with invalid params" do
            it "renders the goal url and gives an error with NG updates" do
                put :update, params: { goal: { id: 1, status: "NG"} }
                expect(response).to render_template(goal_url(1))
                expect(flash.now[:errors]).to be_present
            end
        end

        describe "with valid params" do
            
        end
    end

    describe "DELETE #delete" do
        describe "with invalid params" do
            
        end

        describe "with valid params" do
            
        end
    end
end