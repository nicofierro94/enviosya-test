class AddAvailabilityToUserTable < ActiveRecord::Migration[5.1]
  def change
    add_column :shipments, :kilos, :integer
    remove_column :users, :login_app
    remove_column :users, :login_app_id
    remove_column :users, :created_at, :timestamp
    remove_column :users, :updated_at, :timestamp
    add_index :users, :state
  end
end
