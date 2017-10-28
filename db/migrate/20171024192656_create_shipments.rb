class CreateShipments < ActiveRecord::Migration[5.1]
  def change
    create_table :shipments do |t|
      t.string :origin
      t.string :destination
      t.integer :price
      t.string :sender_mail
      t.string :receiver_mail
      t.string :cadet_mail
      t.string :origin_postal_address
      t.string :destination_postal_address
      t.boolean :is_price_estimated
      t.string :state

      t.timestamps
    end
  end
end
