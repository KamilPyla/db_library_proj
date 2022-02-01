module BooksHelper
  def select_book
    Book.all.map do |book|
      [book.tytul, book.id]
    end
  end
end
