module BooksHelper
  def select_book
    Book.available.map do |book|
      [book.tytul, book.id]
    end
  end

  def return_button(rent)
    rent.data_oddania.nil? ? '' : 'disabled'
  end
end
