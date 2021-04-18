class CreateOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :orders do |t|
      t.integer :member_id
      t.integer :freight
      t.integer :claim
      t.integer :payment
      t.string :postcode
      t.string :adress
      t.string :name
      t.integer :received_status

      t.timestamps
    end
  end
end
