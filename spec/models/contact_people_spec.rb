require 'rails_helper'

RSpec.describe ContactPerson, type: :model do
  describe "#create" do
    it "department, position, nameがあれば登録できること" do
      user = create(:user)
      customer = create(:customer, user_id: user.id)
      contact_person = build(:contact_person, customer_id: customer.id)
      expect(contact_person).to be_valid
    end

    it "departmentがなくても登録できること" do
      user = create(:user)
      customer = create(:customer, user_id: user.id)
      contact_person = build(:contact_person, department: nil, customer_id: customer.id)
      expect(contact_person).to be_valid
    end

    it "positionがなくても登録できること" do
      user = create(:user)
      customer = create(:customer, user_id: user.id)
      contact_person = build(:contact_person, position: nil, customer_id: customer.id)
      expect(contact_person).to be_valid
    end

    it "departmentとpositionがなくても登録できること" do
      user = create(:user)
      customer = create(:customer, user_id: user.id)
      contact_person = build(:contact_person, department: nil, position: nil, customer_id: customer.id)
      expect(contact_person).to be_valid
    end

  end
end
