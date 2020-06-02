class ChangeDataPreparationDayToItems < ActiveRecord::Migration[5.2]
  def change
    change_column :items, :preparation_day, :integer
  end
end
