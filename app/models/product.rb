class Product < ApplicationRecord
  belongs_to :category
  has_many :order_details
  has_many :comments
  has_many :ratings
  has_many :images

  scope :top_trends, (lambda do
    select("products.id, products.price, products.name, images.url,
     sum(order_details.quantity) as order_max")
    .joins(:order_details, :images)
    .group(:id)
    .limit(12)
  end)

  # def self.top_trend
  #   Product.joins(:order_details)
  #   .select("products.id, Sum(order_details.quantity) as tong ")
  #   .group("products.id")
  #   .limit(12)
  # end
end
