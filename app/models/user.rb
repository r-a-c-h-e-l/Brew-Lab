class User < ActiveRecord::Base
  has_secure_password
  has_many :beers
  belongs_to :beer
  has_many :mashes
  has_many :sparges
  has_many :boils
  has_many :chills
  has_many :ferments
  has_many :lagers

  validates :username, presence: true
  validates :password_digest, presence: true
  validates :email, presence: true
end
