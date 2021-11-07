require 'rails_helper'

RSpec.describe Company, type: :model do
  describe "#create" do
    it "name, tel, fax, postal_code, addressがあれば登録できること" do
      user = create(:user)
      company = build(:company, user_id: user.id)
      expect(company).to be_valid
    end

    it "nameがない場合は登録に失敗すること" do
      company = build(:company, name: nil)
      company.valid?
      expect(company.errors[:name]).to include("を入力してください")
    end

    it "telがない場合は登録に失敗すること" do
      company = build(:company, tel: nil)
      company.valid?
      expect(company.errors[:tel]).to include("を入力してください")
    end

    
    it "faxがない場合は登録に失敗すること" do
      company = build(:company, fax: nil)
      company.valid?
      expect(company.errors[:fax]).to include("を入力してください")
    end
    
    
    it "postal_codeがない場合は登録に失敗すること" do
      company = build(:company, postal_code: nil)
      company.valid?
      expect(company.errors[:postal_code]).to include("を入力してください")
    end
    
    
    it "addressがない場合は登録に失敗すること" do
      company = build(:company, address: nil)
      company.valid?
      expect(company.errors[:address]).to include("を入力してください")
    end
    
    context "フォーマット" do
      it "telのフォーマットが正しくない場合、登録に失敗すること" do
        company = build(:company, tel: "1000000000")
        company.valid?
        expect(company.errors[:tel]).to include("は不正な値です")
      end
      
      it "faxのフォーマットが正しくない場合、登録に失敗すること" do
        company = build(:company, fax: "1000000000")
        company.valid?
        expect(company.errors[:fax]).to include("は不正な値です")
      end

      it "postal_codeのフォーマットが正しくない場合、登録に失敗すること" do
        company = build(:company, postal_code: "0000000")
        company.valid?
        expect(company.errors[:postal_code]).to include("は不正な値です")
      end
    end
  end
end
