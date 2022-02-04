class Book < ApplicationRecord
  belongs_to :autor
  belongs_to :category
  belongs_to :publisher
  has_many :rents

  scope :available, -> { left_joins(:rents).where(rents: { book_id: nil, data_oddania: nil }) }

  scope :rented, -> { joins(:rents).where(rents: { data_oddania: nil }) }

  def available?
    Book.available.include?(self)
  end

  def status
    available? ? 'Dostępna' : 'Wypożyczona'
  end

end
