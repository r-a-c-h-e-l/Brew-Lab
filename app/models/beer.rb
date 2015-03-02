class Beer < ActiveRecord::Base
  belongs_to :user
  has_many :mashes
  has_many :sparges
  has_many :boils
  has_many :chills
  has_many :ferments
  has_many :lagers
end
