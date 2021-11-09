require 'rails_helper'

RSpec.describe "Customers", type: :request do
  describe "[Action test]]" do
    before do
      @user = create(:user)
    end

    context "index" do
      it "access by user" do
        sign_in @user
        get customers_path
        expect(response).to have_http_status(200)
      end

      it "access by guest" do
        get customers_path
        expect(response).to have_http_status(302)
      end
    end

    context "new" do
      it "access by user" do
        sign_in @user
        get '/customers/new'
        expect(response).to have_http_status(200)
      end

      it "access by guest" do
        get '/customers/new'
        expect(response).to have_http_status(302)
      end
    end

    context "create" do
      it "access by user" do
        sign_in @user
        post "/customers", :params => { :customer => { :company_name => "test", :user_id => @user.id }}
        expect(response).to redirect_to(customers_path)
      end

      it "access by guest" do
        post "/customers", :params => { :customer => { :company_name => "test", :user_id => @user.id }}
        expect(response).to have_http_status(302)
      end
    end
  end
end
