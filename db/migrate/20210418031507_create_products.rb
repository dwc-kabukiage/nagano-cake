class CreateProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :products do |t|
      t.integer :category_ID
      t.string :name
      t.string :image_id
      t.text :body
      t.integer :price
      t.boolean :is_active

      t.timestamps
    end
  end
end
