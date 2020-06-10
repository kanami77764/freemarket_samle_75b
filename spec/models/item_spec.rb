require 'rails_helper'
describe Item do

  describe '#create' do
    it "全ての入力条件を満たしたら送信できること" do
      user = create(:user)
      category = create(:category)
      item_img = create(:item_img)
      item = FactoryBot.build(:item, category_id: category[:id],seller_id: user[:id])
      expect(item).to be_valid
    end

    it "名前がない場合は登録できないこと" do
      item = build(:item, name: nil)
      item.valid?
      expect(item.errors[:name]).to include("を入力してください")
    end

    it "introduction(説明文)がない場合は登録できないこと" do
      item = build(:item, introduction: nil)
      item.valid?
      expect(item.errors[:introduction]).to include("を入力してください")
    end

    it "category_id(カテゴリーの選択)がない場合は登録できないこと" do
      item = build(:item, category: nil)
      item.valid?
      expect(item.errors[:category]).to include("を入力してください")
    end

    it "item_condition(商品の状態)の選択がない場合は登録できないこと" do
      item = build(:item, item_condition: nil)
      item.valid?
      expect(item.errors[:item_condition]).to include("を入力してください")
    end

    it "postage_payer(発送料の負担)の選択がない場合は登録できないこと" do
      item = build(:item, postage_payer: nil)
      item.valid?
      expect(item.errors[:postage_payer]).to include("を入力してください")
    end

    it "prefecture_code(発送元の地域)の選択がない場合は登録できないこと" do
      item = build(:item, prefecture_code: nil)
      item.valid?
      expect(item.errors[:prefecture_code]).to include("を入力してください")
    end

    it "preparation_day(発送までの日数)の選択がない場合は登録できないこと" do
      item = build(:item, preparation_day: nil)
      item.valid?
      expect(item.errors[:preparation_day]).to include("を入力してください")
    end

    it "price(価格)の入力がない場合は登録できないこと" do
      item = build(:item, price: nil)
      item.valid?
      expect(item.errors[:price]).to include("を入力してください")
    end
    
    it " introductionが1000文字以上であれば登録できないこと " do
      item = build(:item, introduction: "a"*1001 )
      item.valid?
      expect(item.errors[:introduction]).to include("は1000文字以内で入力してください")
    end

    it " nameが40文字以上であれば登録できないこと " do
      item = build(:item, name: "a"*41 )
      item.valid?
      expect(item.errors[:name]).to include("は40文字以内で入力してください")
    end

    it "price(値段)が300以下であれば登録できないこと " do
      item = build(:item, price: 299 )
      item.valid?
      expect(item.errors[:price]).to include("は300以上の値にしてください")
    end
  end

  describe '#update' do
    it "全ての入力条件を満たしたら送信できること" do
      user = create(:user)
      category = create(:category)
      item_img = create(:item_img)
      item = FactoryBot.build(:item, category_id: category[:id],seller_id: user[:id])
      expect(item).to be_valid
    end

    it "名前がない場合は登録できないこと" do
      item = build(:item, name: nil)
      item.valid?
      expect(item.errors[:name]).to include("を入力してください")
    end

    it "introduction(説明文)がない場合は登録できないこと" do
      item = build(:item, introduction: nil)
      item.valid?
      expect(item.errors[:introduction]).to include("を入力してください")
    end

    it "category_id(カテゴリーの選択)がない場合は登録できないこと" do
      item = build(:item, category: nil)
      item.valid?
      expect(item.errors[:category]).to include("を入力してください")
    end

    it "item_condition(商品の状態)の選択がない場合は登録できないこと" do
      item = build(:item, item_condition: nil)
      item.valid?
      expect(item.errors[:item_condition]).to include("を入力してください")
    end

    it "postage_payer(発送料の負担)の選択がない場合は登録できないこと" do
      item = build(:item, postage_payer: nil)
      item.valid?
      expect(item.errors[:postage_payer]).to include("を入力してください")
    end

    it "prefecture_code(発送元の地域)の選択がない場合は登録できないこと" do
      item = build(:item, prefecture_code: nil)
      item.valid?
      expect(item.errors[:prefecture_code]).to include("を入力してください")
    end

    it "preparation_day(発送までの日数)の選択がない場合は登録できないこと" do
      item = build(:item, preparation_day: nil)
      item.valid?
      expect(item.errors[:preparation_day]).to include("を入力してください")
    end

    it "price(価格)の入力がない場合は登録できないこと" do
      item = build(:item, price: nil)
      item.valid?
      expect(item.errors[:price]).to include("を入力してください")
    end
    
    it " introductionが1000文字以上であれば登録できないこと " do
      item = build(:item, introduction: "a"*1001 )
      item.valid?
      expect(item.errors[:introduction]).to include("は1000文字以内で入力してください")
    end

    it " nameが40文字以上であれば登録できないこと " do
      item = build(:item, name: "a"*41 )
      item.valid?
      expect(item.errors[:name]).to include("は40文字以内で入力してください")
    end

    it "price(値段)が300以下であれば登録できないこと " do
      item = build(:item, price: 299 )
      item.valid?
      expect(item.errors[:price]).to include("は300以上の値にしてください")
    end
  end

  describe '#search' do
   
    it "曖昧なキーワードを入れても検索できること" do
      item = build(:item)
      expect(item).to be_valid
    end

    it "検索フォームが空でも全データが表示できること" do
      item = build(:item)
      expect(item).to be_valid

    end

  end
end


