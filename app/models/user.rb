class User < ApplicationRecord
  has_secure_password
  has_many :orders
  has_many :suggests
  has_many :comments
  has_many :ratings
end
