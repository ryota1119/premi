require 'rails_helper'

RSpec.describe "Signups", type: :request do
  describe "[Action test]]" do
    it "step1" do
      get '/signup/step1'
      expect(response).to be_successful
    end

    it "step2" do
    end

    it "create" do
    end

  end
end
