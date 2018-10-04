Category.create!(name: "IPHONE")
Category.create!(name: "SAMSUNG")
Category.create!(name: "NOKIA")
Category.create!(name: "OPPO")
Category.create!(name: "XIAOMI")
Category.create!(name: "MIBISTAR")
Category.create!(name: "SONY")
Category.create!(name: "HUAWAI")
Category.create!(name: "HTC")

categories = Category.order(:created_at)

10.times do |n|
  name = Faker::Name.name
categories.each { |category| category.products.create!(
  name: name,
  price: 10000000,
  quantity: 50 )}
end

User.create!(name: "vanvo96", email: "vtvvan96@gmail.com", password: "123456",
  password_confirmation: "123456", phone: "09112132131", role: true)
30.times do |n|
  name = Faker::Name.name
  email = "abc#{n+1}example@gmail.com"
  password = "password"
  phone = "09112132131"
  User.create!(name:  name,
              email: email,
              password:              password,
              password_confirmation: password,
              phone: phone)
end

users = User.order(name: :DESC).take(20)

users.each { |user| user.orders.create!(order_date: Time.zone.now, status: 0 )}

Order.all.each do |order|
  order.order_details.create! product_id: rand(Product.count) + 1, quantity: rand(20) + 1
end

products = Product.all
products.each { |product| product.images.create!(url: "abc.jpg") }
