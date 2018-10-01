class Order < ApplicationRecord
  enum status: [:waiting, :approve]
  belongs_to :user
  has_many :order_details, dependent: :destroy
  scope :ordered_by_name, ->{order created_at: :DESC}
end
