module BooksHelper
  def select_book
    Book.all.map do |book|
      [book.tytul, book.id]
    end
  end

  def return_button(rent)
    rent.data_oddania.nil? ? '' : 'disabled'
  end
end
