class CreateArticles < ActiveRecord::Migration[6.0]
  def change
    create_table :articles do |t|
      t.string :name, null: false
      t.text :text, null:false
      t.category_id :integer, null:false
      t.grade_id :integer, null:false
      t.postage_id :integer, null:false
      t.area_id :integer, null:false
      t.schedule_id :integer, null: false
      t.price :integer, null: false
      t.user :references, null:false, foreign_key: true

      t.timestamps
    end
  end
end
