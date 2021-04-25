class CreateDeliveries < ActiveRecord::Migration[5.2]
  def change
    create_table :deliveries do |t|
      t.integer :member_id
      t.string :postcode
      t.string :address
      t.string :name

      t.timestamps
    end
  end
end
