require 'rails_helper'

RSpec.describe Item, type: :model do
  describe "#create" do
    it "item_nameがあれば登録できること" do
      user = create(:user)
      item = build(:item, user_id: user.id)
      expect(item).to be_valid
    end

    it "item_nameがない場合は登録に失敗すること" do
      item = build(:item, item_name: nil)
      item.valid?
      expect(item.errors[:item_name]).to include("を入力してください")
    end
  end
end
