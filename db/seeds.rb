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
  email: 't@t',
  password: 'testuser',
  last_name: '伊藤',
  first_name: '太郎',
  last_name_kana: 'イトウ',
  first_name_kana: 'タロウ',
  postcode: '100-0014',
  address: '東京都千代田区永田町1丁目7-1',
  phone_number: '03-3581-5111'
)

Member.all.each do |member|
  member.orders.create!(
    freight: '800',
    claim: '1',
    payment: '1',
    postcode: '000-0000',
    adress: '東京都千代田区永田町1丁目7-1',
    name: '国会',
    received_status: '0',
    created_at: 'new DateTime()',
  )
end