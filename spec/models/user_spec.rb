require 'rails_helper'

describe User do
  describe '#create' do
   
    it "nameとemail、passwordとpassword_confirmationが存在すれば登録できること" do
      user = build(:user)
      expect(user).to be_valid
    end

    it "nameがない場合は登録できないこと" do
      user = build(:user, name: nil)
      user.valid?
      expect(user.errors[:name]).to include("can't be blank")
    end

    it "emailがない場合は登録できないこと" do
      user = build(:user, email: nil)
      user.valid?
      expect(user.errors[:email]).to include("can't be blank")
    end

    it "passwordがない場合は登録できないこと" do
      user = build(:user, password: nil)
      user.valid?
      expect(user.errors[:password]).to include("can't be blank")
    end

    it "passwordが存在してもpassword_confirmationがない場合は登録できないこと" do
      user = build(:user, password_confirmation: "")
      user.valid?
      expect(user.errors[:password_confirmation]).to include("doesn't match Password")
    end

    it "重複したnameが存在する場合は登録できない" do
      user = create(:user)
      another_user = build(:user, name: user.name)
      another_user.valid?
      expect(another_user.errors[:nameがない場合は登録できないこと]).to include("has already been taken")
    end

    it "emailに@とドメインが存在する場合は登録できること " do
      user = create(:user)
      another_user = build(:user, email: "kkk@gmail.com")
      another_user.valid?
      expect(user).to be_valid
    end

    it "emailに@とドメインがない場合は登録できないこと " do
      user = create(:user)
      another_user = build(:user, email: "kkkgmail")
      another_user.valid?
      expect(another_user.errors[:email]).to include("No @domain")
    end

    it "重複したemailが存在する場合は登録できない" do
      user = create(:user)
      another_user = build(:user, email: user.email)
      another_user.valid?
      expect(another_user.errors[:email]).to include("has already been taken")
    end
   
    it " passwordが7文字以上であれば登録できること " do
      user = build(:user, password: "password0", password_confirmation: "password0")
      user.valid?
      expect(user).to be_valid
    end

    it " passwordが6文字以下であれば登録できないこと " do
      user = build(:user, password: "password", password_confirmation: "password")
      user.valid?
      expect(user.errors[:password]).to include("is too short (minimum is 6 characters)")
    end
  end
end
