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

Category.create!(
  name: 'キャンディ'
)

Category.all.each do |c|
  c.products.create!(
    [{
      name: '商品１',
      body: '商品１の紹介',
      price: '100',
      is_active: 'TRUE'
    },{
      name: '商品2',
      body: '商品２の紹介',
      price: '300',
      is_active: 'TRUE'
    }]
  )
end