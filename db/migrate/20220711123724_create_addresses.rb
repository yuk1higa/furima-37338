class CreateAddresses < ActiveRecord::Migration[6.0]
  def change
    create_table :addresses do |t|
      t.string :post_number, null: false
      t.integer :area_id, null:false
      t.string :municipalitie, null: false
      t.string :address, null: false
      t.string :building_name, null: false
      t.string :phone_number, null: false
      t.references :purchase_record, null: false, foreign_key: true


      t.timestamps
    end
  end
end
