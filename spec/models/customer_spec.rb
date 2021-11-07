require 'rails_helper'

RSpec.describe Customer, type: :model do
  describe "#create" do
    it "company_nameがあれば登録できること" do
      user = create(:user)
      customer = build(:customer, user_id: user.id)
      expect(customer).to be_valid
    end

    it "company_nameがない場合は登録に失敗すること" do
      customer = build(:customer, company_name: nil)
      customer.valid?
      expect(customer.errors[:company_name]).to include("を入力してください")
    end
  end
end
