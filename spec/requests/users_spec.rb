require 'rails_helper'

RSpec.describe "Users", type: :request do
  describe "[Action test]" do
    before do
      @user = create(:user)
      @cumpany = create(:company, user_id: @user.id)
    end

    context "show" do
      it "access by user" do
        sign_in @user
        get user_path(@user)
        expect(response).to be_successful
      end

      it "access by guest" do
        get user_path(@user)
        expect(response).to have_http_status(302)
      end
    end

    it "show" do
      sign_in @user
      get user_path(@user)
      expect(response).to have_http_status(200)
    end
  end
end
