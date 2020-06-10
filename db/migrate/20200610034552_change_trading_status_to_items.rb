class ChangeTradingStatusToItems < ActiveRecord::Migration[5.2]
  def change
    change_column :items, :trading_status, :integer, default: 1
  end
end
