require 'rails_helper'

describe Item do
  describe '#create' do
    it "nameがない場合は登録できないこと" do
      item = build(:item, name: nil)
      item.valid?
      expect(item.errors[:name]).to include("can't be blank")
    end

    it "introductionがない場合は登録できないこと" do
      item = build(:item, introduction: nil)
      item.valid?
      expect(item.errors[:introduction]).to include("can't be blank")
    end

    it "priceがない場合は登録できないこと" do
      item = build(:item, price:nil)
      item.valid?
      expect(item.errors[:price]).to include("can't be blank")
    end

    it "category_idがない場合は登録できないこと" do
      item = build(:item, category_id: nil)
      item.valid?
      expect(item.errors[:category_id]).to include("can't be blank")
    end

    it "postage_payerがない場合は登録できないこと" do
      item = build(:item, postage_payer: nil)
      item.valid?
      expect(item.errors[:postage_payer]).to include("can't be blank")
    end

    it "item_conditionがない場合は登録できないこと" do
      item = build(:item, item_condition: nil)
      item.valid?
      expect(item.errors[:item_condition]).to include("can't be blank")
    end

    it "prefecture_codeがない場合は登録できないこと" do
      item = build(:item, prefecture_code:nil)
      item.valid?
      expect(item.errors[:prefecture_code]).to include("can't be blank")
    end
    
    it "preparation_dayがない場合は登録できないこと" do
      item = build(:item, preparation_day:nil)
      item.valid?
      expect(item.errors[:preparation_day]).to include("can't be blank")
    end

    it " nameが40文字以下であれば登録できること " do
      item = build(:item)
      item.valid?
      expect(item.errors[:name]).to include("is too short (minimum is 40 characters)")
    end

    it "introductionが1000文字以下であれば登録できないこと " do
      item = build(:item)
      item.valid?
      expect(item.errors[:introduction]).to include("is too short (minimum is 1000 characters)")
    end
  end
end
