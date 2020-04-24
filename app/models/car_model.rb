class CarModel < ApplicationRecord
  belongs_to :manufacturer
  belongs_to :car_category
end
