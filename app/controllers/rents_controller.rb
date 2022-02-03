# frozen_string_literal: true

class RentsController < ApplicationController
  before_action :set_rent, only: %i[show edit update destroy]

  def index
    @rents = Rent.all
  end

  def show; end

  def new
    @rent = Rent.new
  end

  def edit; end

  def create
    @rent = Rent.new(rent_params)
    if @rent.save
      redirect_to rent_url(@rent), notice: 'Dodano wypożyczenie.'
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    if @rent.update(rent_params)
      redirect_to rent_url(@rent), notice: 'Zaktualizowano wypożyczenie.'
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @rent.destroy
    redirect_to rents_url, notice: 'Usunięto wypożyczenie'
  end

  private

  def set_rent
    @rent = Rent.find(params[:id])
  end

  def rent_params
    params.require(:rent).permit(:planowana_data_oddania, :data_wypozyczenia, :data_oddania, :book_id, :reader_id,
                                 :employee_rent_id)
  end
end
