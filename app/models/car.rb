class Car < ApplicationRecord
  belongs_to :car_model
  has_many :car_rentals
  has_many :rentals, through: :car_rentals
end
