class Customer < ApplicationRecord
  scope :search, ->(query) { where('name LIKE ?', "%#{query}%")
                              .or(where(document: query)) }
end
