class Customer < ApplicationRecord
  has_many :rentals

  scope :search, ->(query) { where('name LIKE ?', "%#{query}%")
                              .or(where(document: query)) }
end