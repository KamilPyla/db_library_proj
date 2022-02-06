# frozen_string_literal: true

class ReadersController < ApplicationController
  before_action :set_reader

  def index
    @readers = Reader.all
  end

  def show; end

  def rank_readers
    @readers = Reader.best_reader
  end

  def best
    @readers = Reader.best_reader
  end

  def new
    @reader = Reader.new
  end

  def rents_all
    @rents = current_user.rents
  end

  def rents_active
    @rents = current_user.rents.active
  end

  def rents_inactive
    @rents = current_user.rents.inactive
  end

  def rents_out_of_term
    @rents = current_user.rents.out_of_term
  end

  def punishments
    @punishments = current_user.punishments
  end

  def edit; end

  def create
    @reader = Reader.new(reader_params)

    if @reader.save
      if current_user.nil?
        log_in(@reader)
        redirect_to root_path, notice: 'Witamy!'
      else
        redirect_to reader_path(@reader),  notice: 'Dodano czytelnika pomyślnie.'
      end
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

  def new_punishment
    @reader
  end

  def create_punishment
    punishment = Punishment.new(kwota: params[:punishment][:kwota], reader_id: params[:id])

    if punishment.save!
      redirect_to admin_readers_rents_path, notice: 'Dodano karę'
    else
      redirect_to admin_readers_rents_path, notice: 'Nie udało się dodać kary'
    end
  end

  def destroy
    @reader.destroy
    redirect_to readers_url, notice: 'Usunięto czytelnika pomyślnie'
  end

  private

  def set_reader
    @reader = Reader.find_by(id: params[:id])
  end

  def reader_params
    params.require(:reader).permit(:imie, :nazwisko, :telefon, :data_urodzenia, :email, :haslo)
  end
end
