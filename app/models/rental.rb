class Rental < ApplicationRecord
  belongs_to :customer
  belongs_to :car_category
end
