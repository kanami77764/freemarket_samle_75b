# トップページ(ルート)
crumb :root do
  link "トップページ", root_path
end

# 会員情報入力ページ(3ページ)
crumb :users_new do
  link "会員情報入力", new_user_path
  parent :root
end

# マイページ
crumb :mypage do
  link "マイページ", new_user_path
  parent :root
end

# ログイン
crumb :login do
  link "ログイン", new_user_path
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



# crumb :root do
#   link "Home", root_path
# end

# crumb :projects do
#   link "Projects", projects_path
# end

# crumb :project do |project|
#   link project.name, project_path(project)
#   parent :projects
# end

# crumb :project_issues do |project|
#   link "Issues", project_issues_path(project)
#   parent :project, project
# end

# crumb :issue do |issue|
#   link issue.title, issue_path(issue)
#   parent :project_issues, issue.project
# end

# If you want to split your breadcrumbs configuration over multiple files, you
# can create a folder named `config/breadcrumbs` and put your configuration
# files there. All *.rb files (e.g. `frontend.rb` or `products.rb`) in that
# folder are loaded and reloaded automatically when you change them, just like
# this file (`config/breadcrumbs.rb`).