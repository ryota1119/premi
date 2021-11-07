require 'rails_helper'

RSpec.describe EstimateDetail, type: :model do
  describe "#create" do
    it "volume, price, item_id, estimate_idがあれば登録できること" do
      user = create(:user)
      customer = create(:customer, user_id: user.id)
      contact_person = create(:contact_person, customer_id: customer.id)
      estimate = create(:estimate, user_id: user.id, customer_id: customer.id, contact_person_id: contact_person.id)
      item = create(:item, user_id: user.id)
      estimate_detail = build(:estimate_detail, item_id: item.id, estimate_id: estimate.id)
      expect(estimate_detail).to be_valid
    end

    it "volumeがない場合は登録に失敗すること" do
      estimate_detail = build(:estimate_detail, volume: nil)
      estimate_detail.valid?
      expect(estimate_detail.errors[:volume]).to include("を入力してください")
    end

    it "priceがない場合は登録に失敗すること" do
      estimate_detail = build(:estimate_detail, price: nil)
      estimate_detail.valid?
      expect(estimate_detail.errors[:price]).to include("を入力してください")
    end
  end
end
