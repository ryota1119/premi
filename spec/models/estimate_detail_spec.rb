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
      expect(customer).to be_valid
    end

    it "volume, priceがなくても登録できること" do
      user = create(:user)
      customer = create(:customer, user_id: user.id)
      contact_person = create(:contact_person, customer_id: customer.id)
      estimate = create(:estimate, user_id: user.id, customer_id: customer.id, contact_person_id: contact_person.id)
      item = create(:item, user_id: user.id)
      estimate_detail = build(:estimate_detail, volume: nil, price: nil, item_id: item.id, estimate_id: estimate.id)
      expect(customer).to be_valid
    end
  end
end
