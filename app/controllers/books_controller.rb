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

  def rent
    rent = @book.rents.build(reader: current_user, 
                            data_wypozyczenia: Date.today, 
                            planowana_data_oddania: Date.today + 1.month)
    redirect_to books_path, notice: 'Miłego czytania' if rent.save!
  end

  def edit; end

  def create
    @book = Book.new(book_params)

    if @book.save
      redirect_to book_url(@book), notice: 'Książka została dodana pomyślnie.'
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    if @book.update(book_params)
      redirect_to book_url(@book), notice: 'Dane książki zostały zaktualizowane'
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @book.destroy
    redirect_to books_url, notice: 'Książka została usunięta'
  end

  private

  def set_book
    @book = Book.find_by(id: params[:id])
  end

  def book_params
    params.require(:book).permit(:tytul, :rok_wydania, :opis, :autor_id, :category_id, :publisher_id)
  end
end
