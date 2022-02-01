class RentsController < ApplicationController
  before_action :set_rent, only: %i[ show edit update destroy ]

  def index
    @rents = Rent.all
  end

  def show
  end

  def new
    @rent = Rent.new
  end

  def edit
  end

  def create
    @rent = Rent.new(rent_params)
    
    binding.pry
    
    respond_to do |format|
      if @rent.save
        format.html { redirect_to rent_url(@rent), notice: "Dodano wypożyczenie." }
      else
        format.html { render :new, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @rent.update(rent_params)
        format.html { redirect_to rent_url(@rent), notice: "Zaktualizowano wypożyczenie." }
      else
        format.html { render :edit, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @rent.destroy

    respond_to do |format|
      format.html { redirect_to rents_url, notice: "Usunięto wypożyczenie" }
      format.json { head :no_content }
    end
  end

  private
    def set_rent
      @rent = Rent.find(params[:id])
    end

    def rent_params
      params.require(:rent).permit(:planowana_data_oddania, :data_wypozyczenia, :data_oddania, :book_id, :reader_id, :employee_rent_id)
    end
end
