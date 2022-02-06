# frozen_string_literal: true

class RentsController < ApplicationController
  before_action :set_rent

  def index
    @rents = Rent.all
  end

  def inactive
    @rents = Rent.inactive
  end

  def active
    @rents = Rent.active
  end

  def out_of_term
    @out_of = true
    @rents = Rent.out_of_term
  end

  def show; end

  def new
    @rent = Rent.new
  end

  def return
    employee_id = current_user.employee? ? current_user.id : nil
    @rent.update(data_oddania: Date.today, employee_return_id: employee_id)
    redirect_to :rents
  end

  def readers_rents
    @reader = Reader.find_by(id: params[:id])
  end

  def prelongate
    @rent.planowana_data_oddania += 1.month

    redirect_to readers_rents_path, notice: 'Data oddania została przedłużona' if @rent.save!
  end

  def edit; end

  def create
    @rent = Rent.new(rent_params)
    if @rent.save
      redirect_to :all_rents, notice: 'Dodano wypożyczenie.' unless current_user.reader?
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
    @rent = Rent.find_by(id: params[:id])
  end

  def rent_params
    params.require(:rent).permit(:planowana_data_oddania, :data_wypozyczenia, :data_oddania, :book_id, :reader_id,
                                 :employee_rent_id)
  end
end
