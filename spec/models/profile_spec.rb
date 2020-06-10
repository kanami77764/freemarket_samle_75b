require 'rails_helper'

describe Profile do
  describe '#create' do
   
    it "first_name,family_name,first_name_kana,family_name_kana,birth_dayが存在すれば登録できること" do
      profile = build(:profile)
      expect(profile).to be_valid
    end

    it "first_nameがない場合は登録できないこと" do
      profile = build(:profile, first_name: nil)
      profile.valid?
      expect(profile.errors[:first_name]).to include("全角で入力して下さい", "を入力してください")
    end

    it "family_nameがない場合は登録できないこと" do
      profile = build(:profile, family_name: nil)
      profile.valid?
      expect(profile.errors[:family_name]).to include("全角で入力して下さい", "を入力してください")
    end
    

    it "first_name_kanaがない場合は登録できないこと" do
      profile = build(:profile, first_name_kana: nil)
      profile.valid?
      expect(profile.errors[:first_name_kana]).to include("全角カタカナのみで入力して下さい", "を入力してください")
    end

    it "family_name_kanaがない場合は登録できないこと" do
      profile = build(:profile, family_name_kana: nil)
      profile.valid?
      expect(profile.errors[:family_name_kana]).to include("全角カタカナのみで入力して下さい", "を入力してください")
    end

    it "birth_dayがない場合は登録できないこと" do
      profile = build(:profile, birth_day: nil)
      profile.valid?
      expect(profile.errors[:birth_day]).to include("を入力してください")
    end

    it "first_nameが全角である場合は登録できること" do
      profile = build(:profile, first_name: "太郎")
      expect(profile).to be_valid
    end

    it "first_nameが全角でない場合は登録できないこと" do
      profile = build(:profile, first_name: "tarou")
      profile.valid?
      expect(profile.errors[:first_name]).to include("全角で入力して下さい")
    end

    it "family_nameが全角である場合は登録できること" do
      profile = build(:profile, family_name: "山田")
      expect(profile).to be_valid
    end

    it "family_nameが全角でない場合は登録できないこと" do
      profile = build(:profile, family_name: "yamada")
      profile.valid?
      expect(profile.errors[:family_name]).to include("全角で入力して下さい")
    end

    it "first_name_kanaが全角カタカナである場合は登録できること" do
      profile = build(:profile, family_name: "ヤマダ")
      expect(profile).to be_valid
    end

    it "first_name_kanaが全角でない場合は登録できないこと" do
      profile = build(:profile, first_name_kana: "tarou")
      profile.valid?
      expect(profile.errors[:first_name_kana]).to include("全角カタカナのみで入力して下さい")
    end

    it "first_name_kanaがカタカナでない場合は登録できないこと" do
      profile = build(:profile, first_name_kana: "たろう")
      profile.valid?
      expect(profile.errors[:first_name_kana]).to include("全角カタカナのみで入力して下さい")
    end

    it "family_name_kanaが全角カタカナである場合は登録できること" do
      profile = build(:profile, family_name_kana: "ヤマダ")
      expect(profile).to be_valid
    end
    
    it "family_name_kanaが全角でない場合は登録できないこと" do
      profile = build(:profile, family_name_kana: "yamada")
      profile.valid?
      expect(profile.errors[:family_name_kana]).to include("全角カタカナのみで入力して下さい")
    end

    it "family_name_kanaがカタカナでない場合は登録できないこと" do
      profile = build(:profile, family_name_kana: "やまだ")
      profile.valid?
      expect(profile.errors[:family_name_kana]).to include("全角カタカナのみで入力して下さい")
    end
  end
end
