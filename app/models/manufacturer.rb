class Manufacturer < ApplicationRecord
  validates :name, uniqueness: { message: 'Nome deve ser único' }
  validates :name, presence: { message: 'Nome não pode ficar em branco' }
end
