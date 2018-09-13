class User < ApplicationRecord
  has_many :orders
  has_many :suggests
  has_many :comments
  has_many :ratings
  scope :ordered_by_name, ->order(name: :ASC)

  before_save{email.downcase!}
  validates :name, presence: true,
    length: {maximum: Settings.user.name.length.maximum}
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true,
    length: {maximum: Settings.user.email.length.maximum},
    format: {with: VALID_EMAIL_REGEX},
    uniqueness: {case_sensitive: false}
  has_secure_password
  validates :password, presence: true,
    length: {minimum: Settings.user.password.length.minimum}
  validates :phone, presence: true

  def self.digest string
    cost =  if ActiveModel::SecurePassword.min_cost
              BCrypt::Engine::MIN_COST
            else
              BCrypt::Engine.cost
            end
    BCrypt::Password.create(string, cost: cost)
  end
end
