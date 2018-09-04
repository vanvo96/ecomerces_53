class Product < ApplicationRecord
  belongs_to :category
  has_many :order_details
  has_many :comments
  has_many :ratings
  has_many :images

  scope :order_by_newest, ->{order(created_at: :DESC).limit(15)}
  scope :joins_images, ->{joins(:images)}

  scope :top_trends, (lambda do
    select(:id, :name, :price,
      "images.url, sum(order_details.quantity) as order_max")
    .joins(:order_details, :images)
    .group(:id)
    .limit(12)
  end)

  scope :iphone_products, (lambda do
    select(:id, :name, :price, "images.url")
    .joins(:category, :images)
    .where(categories: {name: "IPHONE"})
    .order(created_at: :DESC)
    .limit(8)
  end)

  scope :samsung_products, (lambda do
    select(:id, :name, :price, "images.url")
    .joins(:category, :images)
    .where(categories: {name: "SAMSUNG"})
    .order(created_at: :DESC)
    .limit(8)
  end)
end
