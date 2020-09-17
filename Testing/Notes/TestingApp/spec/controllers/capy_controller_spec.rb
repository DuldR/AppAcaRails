require 'rails_helper'

RSpec.describe CapysController, type: :controller do

    describe "GET #index" do
        it "renders the capy's index" do
            get :index
            expect(response).to be_success
            expect(response).to render_template(:index)
        end
    end

    describe "GET #show" do
        it "render the show template" do
            capy = Capy.create!(name: "booty", color: "blue" )
            get :show, params: { id: capy.id }
            expect(response).to render_template(:show)
        end

        context "If the capybara does not exist" do
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

    describe "POST #create" do
        context "with invalid params" do
            it "renders the new template"

        end

        context "with valid params" do
            it "redirects to capy page on success"

        end


    end


end