class Book < ApplicationRecord
  belongs_to :autor
  belongs_to :category
  belongs_to :publisher
  has_many :rents

  scope :available, -> { left_joins(:rents).where(rents: { book_id: nil }) }

  scope :rented, -> { joins(:rents) }

  def available?
    Book.available.include?(self)
  end

end
