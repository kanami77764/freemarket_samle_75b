class ChangeDataTradingStatusToItems < ActiveRecord::Migration[5.2]
  def change
    change_column :items, :trading_status, :integer
  end
end
