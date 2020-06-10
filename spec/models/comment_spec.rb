require 'rails_helper'
describe Comment do
  
  describe '#create' do
    it "user_id、item_id、コメントが存在すれば登録できること" do
      user = create(:user)
      item = create(:item)
      comment = FactoryBot.build(:comment, user_id: user[:id], item_id: item[:id])
      expect(comment).to be_valid
    end

    it "user_idがない場合は登録できないこと" do
      comment = build(:comment, user_id: nil)
      comment.valid?
      expect(comment.errors[:user]).to include("を入力してください")
    end

    it "item_idがない場合は登録できないこと" do
      comment = build(:comment,item_id: nil)
      comment.valid?
      expect(comment.errors[:item]).to include("を入力してください")
    end

    it "コメントがない場合は登録できないこと" do
      comment = build(:comment, comment: nil)
      comment.valid?
      expect(comment.errors[:comment]).to include("を入力してください")
    end

    it "コメントが101文字以上の場合は登録できないこと" do
      comment = build(:comment, comment: "a"*101 )
      comment.valid?
      expect(comment.errors[:comment]).to include("は100文字以内で入力してください")
    end

    it "コメントが2文字以下の場合は登録できないこと" do
      comment = build(:comment, comment: "aa" )
      comment.valid?
      expect(comment.errors[:comment]).to include("は3文字以上で入力してください")
    end
  end
end
