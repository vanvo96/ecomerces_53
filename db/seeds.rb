13.times do |n|
  Category.create!(name: "iphone - #{n}")
end

categories = Category.order(:created_at)

10.times do |n|
categories.each { |category| category.products.create!(
  name: "Sam sung s9 #{n+1}",
  price: 10000000,
  quantity: 50 )}
end

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

users.each { |user| user.orders.create!(order_date: Time.zone.now, status: false )}

Order.all.each do |order|
  order.order_details.create! product_id: rand(Product.count) + 1, quantity: rand(100) + 1
end

products = Product.all
products.each { |product| product.images.create!(url: "abc.jpg") }


