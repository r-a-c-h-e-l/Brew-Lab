class Chill < ActiveRecord::Base
  belongs_to :beer
  belongs_to :user
end
