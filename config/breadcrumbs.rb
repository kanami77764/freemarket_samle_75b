# トップページ(ルート)
crumb :root do
  link "トップページ", root_path
end

# 会員情報入力ページ(3ページ)
crumb :users_new do
  link "会員情報入力", users_path
  parent :root
end

# マイページ
crumb :mypage do
  link "マイページ", users_path
  parent :root
end

# ログイン
crumb :login do
  link "ログイン", users_path
  parent :root
end

# ログアウトページ
crumb :logout do
  link "ログアウト", edit_user_path
  parent :mypage
end

# 商品出品ページ
crumb :items_new do
  link "商品出品", new_item_path
  parent :mypage
end

# 商品詳細ページ
crumb :items_show do
  link "商品詳細", new_item_path
  parent :root
end

#カード登録画面の時専用のマイページ
crumb :card_index do
  link "マイページ", new_card_path
  parent :root
end

#カード登録結果ページ
crumb :card_show do
  link "カード登録一覧"
  parent :card_index
end