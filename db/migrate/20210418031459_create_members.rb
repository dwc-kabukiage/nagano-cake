class CreateMembers < ActiveRecord::Migration[5.2]
  def change
    create_table :members do |t|
      t.string :last_name
      t.string :first_name
      t.string :last_name_kana
      t.string :first_name_kana
      t.string :email
      t.string :postcode
      t.string :address
      t.string :encrypted_password
      t.string :phone_number
      t.boolean :is_deleted

      t.timestamps
    end
  end
end
