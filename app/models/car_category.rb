class CarCategory < ApplicationRecord
  has_many :car_models
  has_many :cars, through: :car_models
end
