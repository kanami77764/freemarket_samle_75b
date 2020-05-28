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
      expect(profile.errors[:first_name]).to include("can't be blank")
    end

    it "family_nameがない場合は登録できないこと" do
      profile = build(:profile, family_name: nil)
      profile.valid?
      expect(profile.errors[:family_name]).to include("can't be blank")
    end
    

    it "first_name_kanaがない場合は登録できないこと" do
      profile = build(:profile, first_name_kana: nil)
      profile.valid?
      expect(profile.errors[:first_name_kana]).to include("can't be blank")
    end

    it "family_name_kanaがない場合は登録できないこと" do
      profile = build(:profile, family_name_kana: nil)
      profile.valid?
      expect(profile.errors[:family_name_kana]).to include("can't be blank")
    end

    it "birth_dayがない場合は登録できないこと" do
      profile = build(:profile, birth_day: nil)
      profile.valid?
      expect(profile.errors[:birth_day]).to include("can't be blank")
    end

    it "first_nameが全角である場合は登録できること" do
      profile = build(:profile, first_name: "梨華")
      expect(profile).to be_valid
    end

    it "first_nameが全角でない場合は登録できないこと" do
      profile = build(:profile, first_name: "rika")
      profile.valid?
      expect(profile.errors[:first_name]).to include("can't be hankaku")
    end

    it "family_nameが全角である場合は登録できること" do
      profile = build(:profile, family_name: "有吉")
      expect(profile).to be_valid
    end

    it "family_nameが全角でない場合は登録できないこと" do
      profile = build(:profile, family_name: "aiyosi")
      profile.valid?
      expect(profile.errors[:family_name]).to include("can't be hankaku")
    end

    it "first_name_kanaが全角カタカナである場合は登録できること" do
      profile = build(:profile, family_name: "アリヨシ")
      expect(profile).to be_valid
    end

    it "first_name_kanaが全角でない場合は登録できないこと" do
      profile = build(:profile, first_name_kana: "rika")
      profile.valid?
      expect(profile.errors[:first_name_kana]).to include("can't be hankaku")
    end

    it "first_name_kanaがカタカナでない場合は登録できないこと" do
      profile = build(:profile, first_name_kana: "りか")
      profile.valid?
      expect(profile.errors[:first_name_kana]).to include("can't be hiragana")
    end

    it "family_name_kanaが全角カタカナである場合は登録できること" do
      profile = build(:profile, family_name_kana: "アリヨシ")
      expect(profile).to be_valid
    end
    
    it "family_name_kanaが全角でない場合は登録できないこと" do
      profile = build(:profile, family_name_kana: "ariyosi")
      profile.valid?
      expect(profile.errors[:family_name_kana]).to include("can't be hankaku")
    end

    it "family_name_kanaがカタカナでない場合は登録できないこと" do
      profile = build(:profile, family_name_kana: "ありよし")
      profile.valid?
      expect(profile.errors[:family_name_kana]).to include("can't be hiragana")
    end
  end
end
