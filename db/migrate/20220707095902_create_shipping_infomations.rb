class CreateShippingInfomations < ActiveRecord::Migration[6.0]
  def change
    create_table :shipping_infomations do |t|
      t.string :string, null: false
      t.integer :area, null:false
      t.string :municipalitie, null: false
      t.string :address, null: false
      t.string :building_name, null: false
      t.integer :phone_number, null: false

      t.timestamps
    end
  end
end
