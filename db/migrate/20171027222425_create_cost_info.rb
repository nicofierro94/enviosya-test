class CreateCostInfo < ActiveRecord::Migration[5.1]
  def change
    create_table :info_areas do |t|
      t.string :cost_to_areas
      t.string :area_id
      t.string :area_name
      t.string :polygon
    end
  end
end
