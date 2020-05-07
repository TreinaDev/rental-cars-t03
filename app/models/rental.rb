class Rental < ApplicationRecord
  belongs_to :customer
  belongs_to :car_category
  has_one :car_rental
  has_one :car, through: :car_rental

  before_create :generate_code

  private

  def generate_code
    self.code = SecureRandom.alphanumeric(6).upcase
  end
end
