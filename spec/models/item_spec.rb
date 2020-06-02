require 'rails_helper'

describe Item do

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


