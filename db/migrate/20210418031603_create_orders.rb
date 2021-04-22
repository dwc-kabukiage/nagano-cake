class CreateOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :orders do |t|
      t.integer :member_id
      t.integer :freight, default: 800
      t.integer :claim
      t.integer :payment, default: 0
      t.string :postcode
      t.string :address
      t.string :name
      t.integer :received_status, default: 0

      t.timestamps
    end
  end
end
