class AddDefaultValueToColumn < ActiveRecord::Migration[5.1]
  def change
    change_column :users, :is_first_time, :boolean, default: true
  end
end
