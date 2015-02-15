class User < ActiveRecord::Base
  has_secure_password
  has_many :beers

  validates :username, presence: true
  validates :password_digest, presence: true
  validates :email, presence: true
end
