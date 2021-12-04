require "rails_helper"

require_relative "../shared_contexts/shared_stuff.rb"
RSpec.describe UsersController, type: :controller do
    include_context 'shared stuff'
    context "Call index Function" do
        it "should return all users" do
            get :index
            do_test_response
        end
    end

    context "Call show Function" do
        it "should return 200 status" do
            get :show, :params => { :id => user.id }
            do_test_response
        end
    end

    context "Call destroy Function" do
        it "should return 200 status" do
            delete :destroy, :params => { :id => user.id }
            do_test_response
        end
    end

    context "Call Update function" do
        it "should return 200 status" do
            put :update, :params => { :id => user.id, :user => { :name => "new arslan"} }
            do_test_response
        end
    end

end