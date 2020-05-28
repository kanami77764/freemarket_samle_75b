require 'rails_helper'

describe SendingDestination do
  describe '#create' do
   
    it "destination_first_name,destination_family_name,destination_first_name_kana,destination_family_name_kana,post_code,prefecture_code,city,house_numberが存在すれば登録できること" do
      sending_destination = build(:sending_destination)
      expect(sending_destination).to be_valid
    end

    it "destination_first_nameがない場合は登録できないこと" do
      sending_destination = build(:sending_destination, destination_first_name: nil)
      sending_destination.valid?
      expect(sending_destination.errors[:destination_first_name]).to include("can't be blank")
    end


    it "destination_family_nameがない場合は登録できないこと" do
      sending_destination = build(:sending_destination, destination_family_name: nil)
      sending_destination.valid?
      expect(sending_destination.errors[:destination_family_name]).to include("can't be blank")
    end


    it "destination_first_name_kanaがない場合は登録できないこと" do
      sending_destination = build(:sending_destination, destination_first_name_kana: nil)
      sending_destination.valid?
      expect(sending_destination.errors[:destination_first_name_kana]).to include("can't be blank")
    end


    it "destination_family_name_kanaがない場合は登録できないこと" do
      sending_destination = build(:sending_destination, destination_family_name_kana: nil)
      sending_destination.valid?
      expect(sending_destination.errors[:destination_family_name_kana]).to include("can't be blank")
    end


    it "post_codeがない場合は登録できないこと" do
      sending_destination = build(:sending_destination, post_code: nil)
      sending_destination.valid?
      expect(sending_destination.errors[:post_code]).to include("can't be blank")
    end

    it "prefecture_codeがない場合は登録できないこと" do
      sending_destination = build(:sending_destination, prefecture_code: nil)
      sending_destination.valid?
      expect(sending_destination.errors[:prefecture_code]).to include("can't be blank")
    end
  

    it "house_numberがない場合は登録できないこと" do
      sending_destination = build(:sending_destination, house_number: nil)
      sending_destination.valid?
      expect(sending_destination.errors[:house_number]).to include("can't be blank")
    end
  end
end
