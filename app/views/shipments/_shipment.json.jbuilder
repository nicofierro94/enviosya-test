json.extract! shipment, :id, :origin, :destination, :price, :sender_mail, :receiver_mail, :cadet_mail, :origin_postal_address, :destination_postal_address, :is_price_estimated, :state, :created_at, :updated_at
json.url shipment_url(shipment, format: :json)
