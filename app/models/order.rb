class Order < ApplicationRecord
  enum status: {waiting: 0, approve: 1}
  belongs_to :user
  has_many :order_details, dependent: :destroy
  scope :select_newest, ->{order created_at: :DESC}

  def statuses_selectbox
    Order.statuses.map {|k, v| [k, k] }
  end
end
