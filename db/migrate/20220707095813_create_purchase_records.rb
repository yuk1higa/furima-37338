class CreatePurchaseRecords < ActiveRecord::Migration[6.0]
  def change
    create_table :purchase_records do |t|
      t.references :user_id, null: false
      t.references :item_id, null: false

      t.timestamps
    end
  end
end
