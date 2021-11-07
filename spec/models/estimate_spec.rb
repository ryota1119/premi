require 'rails_helper'

RSpec.describe Estimate, type: :model do
  describe "#create" do
    it "effective, note, user_id, customer_id, contact_person_idがあれば登録できること" do
      user = create(:user)
      customer = create(:customer, user_id: user.id)
      contact_person = create(:contact_person, customer_id: customer.id)
      estimate = build(:estimate, user_id: user.id, customer_id: customer.id, contact_person_id: contact_person.id)
      expect(estimate).to be_valid
    end

    it "effective, noteがなくても登録できること" do
      user = create(:user)
      customer = create(:customer, user_id: user.id)
      contact_person = create(:contact_person, customer_id: customer.id)
      estimate = build(:estimate, effective: nil, note: nil, user_id: user.id, customer_id: customer.id, contact_person_id: contact_person.id)
      expect(estimate).to be_valid
    end
  end
end
