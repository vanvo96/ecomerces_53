class Product < ApplicationRecord
  belongs_to :category
  has_many :order_details
  has_many :comments
  has_many :ratings
  has_many :images
end
