class CreateItems < ActiveRecord::Migration[5.2]
  def change
    create_table :items do |t|
      t.string :name
      t.text :introduction
      t.integer :price
      t.text :brand
      t.text :item_condition, foreign_key: true
      t.text :postage_payer, foreign_key: true
      t.integer :prefecture_code
      t.text :size, foreign_key: true
      t.text :preparation_day, foreign_key: true
      t.text :postage_type, foreign_key: true
      t.references :category
      t.text :trading_status
      t.references :seller
      t.references :buyer
      t.timestamps
    end
    add_foreign_key :items, :users, column: :seller_id
    add_foreign_key :items, :users, column: :buyer_id
  end
end