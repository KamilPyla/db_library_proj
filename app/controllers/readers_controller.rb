# frozen_string_literal: true

class ReadersController < ApplicationController
  before_action :set_reader, only: %i[show edit update destroy]

  def index
    @readers = Reader.all
  end

  def show; end

  def new
    @reader = Reader.new
  end

  def edit; end

  def create
    @reader = Reader.new(reader_params)

    if @reader.save
      log_in(@reader)
      redirect_to reader_url(@reader), notice: 'Dodano czytelnika pomyślnie.'
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    if @reader.update(reader_params)
      log_in(@reader)
      redirect_to reader_url(@reader), notice: 'Zaukualizowano dane czytelnika.'
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @reader.destroy
    redirect_to readers_url, notice: 'Usunięto czytelnika pomyślnie.'
  end

  private

  def set_reader
    @reader = Reader.find(params[:id])
  end

  def reader_params
    params.require(:reader).permit(:imie, :nazwisko, :telefon, :data_urodzenia, :email, :haslo)
  end
end
