require 'rails_helper'

RSpec.describe User, type: :model do
  describe "#create" do
    it "name, email, password, password_confirmationがあれば登録できること" do
      user = build(:user)
      expect(user).to be_valid
    end

    it "nameがなければ登録に失敗すること" do
      user = build(:user, name: nil)
      user.valid?
      expect(user.errors[:name]).to include("を入力してください")
    end
    
    it "emailがなければ登録に失敗すること" do
      user = build(:user, email: nil)
      user.valid?
      expect(user.errors[:email]).to include("を入力してください")
    end

    it "emailのフォーマットが正しくない場合、登録に失敗すること" do
      user = build(:user, email: "exampletestcom")
      user.valid?
      expect(user.errors[:email]).to include "は不正な値です"
end

    it "passwordがなければ登録に失敗すること" do
      user = build(:user, password: nil)
      user.valid?
      expect(user.errors[:password]).to include("を入力してください")
    end

    it "passwordが存在してもpassword_confirmationがない場合登録に失敗すること" do
      user = build(:user, password_confirmation: "")
      user.valid?
      expect(user.errors[:password_confirmation]).to include("とPasswordの入力が一致しません")
    end

    it "重複したemailが存在する場合登録に失敗すること" do
      user = create(:user)
      another_user = build(:user, email: user.email)
      another_user.valid?
      expect(another_user.errors[:email]).to include("はすでに存在します")
    end

    it "passwordが6文字以上かつ半角英数字を両方含む場合であれば登録できること" do
      user = build(:user, password: "ryota1", password_confirmation: "ryota1")
      expect(user).to be_valid 
    end

    it "passwordが６文字以下の場合登録に失敗すること" do
      user = build(:user, password: "ryo11")
      user.valid?
      expect(user.errors[:password]).to include("は6文字以上で入力してください")
    end

    it "passwordが半角英数字以外を含む場合登録に失敗すること" do
      user = build(:user, password: "ryotaか")
      user.valid?
      expect(user.errors[:password]).to include("は不正な値です")
    end

  end
end
