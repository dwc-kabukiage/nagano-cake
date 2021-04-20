# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Manager.create!(
  email: 'm@m',
  password: 'manager'
)

Member.create!(
  email: 'a@a',
  password: 'aaaaaa',
  last_name: 'A',
  first_name: 'a',
  last_name_kana: 'AA',
  first_name_kana: 'aa',
  postcode: '000-0000',
  address: 'A都A区',
  phone_number: '00-0000-0000'
)

Member.all.each do |member|
  member.orders.create!(
    freight: '800',
    claim: '500',
    payment: 1,
    postcode: '000-0000',
    address: 'A県A市',
    name: '配送先A',
    received_status: 1
  )
end