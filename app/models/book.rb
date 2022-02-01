class Book < ApplicationRecord
  belongs_to :autor
  belongs_to :category
  belongs_to :publisher
  has_many :rents

  # scope :available where()
end
