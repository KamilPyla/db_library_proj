class Book < ApplicationRecord
  belongs_to :autor
  belongs_to :category
  belongs_to :publisher
  has_many :rents

  scope :rented, -> do
    joins('JOIN rents on rents.book_id = books.id where data_oddania is NULL')
  end

  scope :available, -> do 
    joins('LEFT JOIN rents ON rents.book_id = books.id AND rents.data_oddania is NULL')
    .where('book_id is NULL')
  end

  def available?
    Book.available.include?(self)
  end

  def status
    available? ? 'Dostępna' : 'Wypożyczona'
  end

  def rents
    Rent.where("book_id = #{id}")
  end
end
