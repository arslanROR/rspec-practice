require "rails_helper"

RSpec.describe UsersController, type: :controller do
    context "Call index Function" do
        it "should return all users" do
            get :index
            expect(assigns[:users]).to eq(User.all)
            # expect(response.status).to eq(200)
        end
    end

    context "Call show Function" do
        let(:user) { User.create!(name: 'arslan') }
        it "should return 200 status" do
            get :show, :params => { :id => user.id }
            parsed_body = JSON.parse(response.body)
            expect(parsed_body['status']).to eq(200)
        end
    end

    context "Call destroy Function" do
        let(:user) { User.create!(name: 'arslan') }
        it "should return 200 status" do
            delete :destroy, :params => { :id => user.id }
            parsed_body = JSON.parse(response.body)
            expect(parsed_body['status']).to eq(200)
        end
    end

    context "Call Update function" do
        let(:user) { User.create!(name: 'arslan') }
        it "should return 200 status" do
            put :update, :params => { :id => user.id, :user => { :name => "new arslan"} }
            parsed_body = JSON.parse(response.body)
            expect(parsed_body['status']).to eq(200)
        end
    end

end