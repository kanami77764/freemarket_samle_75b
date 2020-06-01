require "csv"

# カテゴリ機能において、カテゴリ一覧をCSVファイルから読み込む記述
# ターミナルで rake db:seed を実施し、親カテゴリのancestryを空欄にしてください
CSV.foreach('db/category.csv', headers: true) do |row|
  Category.create(
    name: row['name'],
    ancestry: row['ancestry']
  )
  
end