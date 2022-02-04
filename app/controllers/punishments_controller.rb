# frozen_string_literal: true

class PunishmentsController < ApplicationController
  before_action :set_punishment

  def index
    @punishments = Punishment.all
  end

  def new
    @punishment = Punishment.new
  end

  def readers_punishments
    @reader = Reader.find_by(id: params[:id])
  end

  def edit; end

  def create
    @punishment = Punishment.new(punishment_params)

    if @punishment.save
      redirect_to punishment_url(@punishment), notice: 'Dodano karę.'
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    if @punishment.update(punishment_params)
      redirect_to punishment_url(@punishment), notice: 'Zaktualizowano karę.'
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @punishment.destroy
    redirect_to punishments_url, notice: 'Usunięto karę.'
  end

  private

  def set_punishment
    @punishment = Punishment.find_by(id: params[:id])
  end

  def punishment_params
    params.require(:punishment).permit(:kwota, :reader_id)
  end
end
