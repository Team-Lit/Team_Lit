# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# Admin.create!(
  # email: 'ppp@ppp',
  # password: 'qqqqqq',
# )

11.times do |n|
  Order.create(
  public_id: n,
  address_name: "#{n}#{n}",
  zip: "#{n}#{n}#{n}-#{n}#{n}#{n}#{n}",
  address: "#{n}市#{n}番#{n}号",
  total_price: "#{n}#{n}#{n}#{n}",
  payment_method: 0,
  delivery_status: 0,
  created_at: "#{n}/#{n}/#{n}"
  )
end
  