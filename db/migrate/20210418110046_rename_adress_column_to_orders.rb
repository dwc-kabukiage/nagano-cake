class RenameAdressColumnToOrders < ActiveRecord::Migration[5.2]
  def change
    rename_column :orders, :address, :address
  end
end
