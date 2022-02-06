# frozen_string_literal: true

class BooksController < ApplicationController
  before_action :set_book

  def index
    @books = Book.all
  end

  def show; end

  def new
    @book = Book.new
  end

  def available
    @books = Book.available
  end

  def rented
    @books = Book.rented
  end

  def most_popular
    @books = Book.most_popular
  end

  def author_books
    @autor = Autor.find_by(id: params[:id])
    @books = Book.author(@autor.id)
  end

  def category_books
    @category = Category.find_by(id: params[:id])
    @books = Book.category(params[:id])
  end

  def publisher_books
    @publisher = Publisher.find_by(id: params[:id])
    @books = Book.publisher(params[:id])
  end

  def rent
    rent = Rent.new(reader: current_user, 
                            data_wypozyczenia: Date.today, 
                            planowana_data_oddania: Date.today + 1.month,
                            book: @book)
    redirect_to books_path, notice: 'Miłego czytania' if rent.save!
  end

  def edit; end

  def create
    @book = Book.new(book_params)

    if @book.save
      redirect_to :all_books, notice: 'Książka została dodana pomyślnie.'
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    if @book.update(book_params)
      redirect_to :all_books, notice: 'Dane książki zostały zaktualizowane'
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @book.destroy
    redirect_to :all_books, notice: 'Książka została usunięta'
  end

  private

  def set_book
    @book = Book.find_by(id: params[:id])
  end

  def book_params
    params.require(:book).permit(:tytul, :rok_wydania, :opis, :autor_id, :category_id, :publisher_id)
  end
end
