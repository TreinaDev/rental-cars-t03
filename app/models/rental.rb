class Rental < ApplicationRecord
  belongs_to :customer
  belongs_to :car_category
  has_one :car_rental
  has_one :car, through: :car_rental

  before_create :generate_code

  enum status: { scheduled: 0, ongoing: 5 }

  private

  def generate_code
    self.code = loop do
      code = SecureRandom.alphanumeric(6).upcase
      break code unless Rental.exists?(code: code)
    end
  end
end
