class RenameCategoryIdColumnToProducts < ActiveRecord::Migration[5.2]
  def change
    rename_column :products, :category_ID, :category_id
  end
end
