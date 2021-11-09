require 'rails_helper'

RSpec.describe "Items", type: :request do
  describe "GET /index" do
    before do
      @user = create(:user)
      @cumpany = create(:company, user_id: @user.id)
    end

    context "index" do
      it "access by user" do
        sign_in @user
        get items_path
        expect(response).to have_http_status(200)
      end

      it "access by guest" do
        get items_path
        expect(response).to have_http_status(302)
      end
    end

    context "new" do
      it "access by user" do
        sign_in @user
        get items_path
        expect(response).to have_http_status(200)
      end

      it "access by guest" do
        get items_path
        expect(response).to have_http_status(302)
      end
    end

    context "create" do
      it "access by user" do
        sign_in @user
        post "/items", :params => { :item => { :item_name => "test", :user_id => @user.id }}
        expect(response).to redirect_to(items_path)
      end

      it "access by guest" do
        post "/items", :params => { :item => { :item_name => "test", :user_id => @user.id }}
        expect(response).to have_http_status(302)
      end
    end
  end
end
