class Category < ApplicationRecord
  has_many :products
  validates :name, presence: true
  scope :ordered_by_name, ->{order(name: :ASC)}
end
