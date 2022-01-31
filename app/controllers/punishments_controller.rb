class PunishmentsController < ApplicationController
  before_action :set_punishment, only: %i[ show edit update destroy ]

  def index
    @punishments = Punishment.all
  end

  def show
  end

  def new
    @punishment = Punishment.new
  end

  def edit
  end

  def create
    @punishment = Punishment.new(punishment_params)

    respond_to do |format|
      if @punishment.save
        format.html { redirect_to punishment_url(@punishment), notice: "Dodano karę." }
      else
        format.html { render :new, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @punishment.update(punishment_params)
        format.html { redirect_to punishment_url(@punishment), notice: "Zaktualizowano karę." }
      else
        format.html { render :edit, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @punishment.destroy

    respond_to do |format|
      format.html { redirect_to punishments_url, notice: "Usunięto karę." }
    end
  end

  private
    def set_punishment
      @punishment = Punishment.find(params[:id])
    end

    def punishment_params
      params.require(:punishment).permit(:kwota, :reader_id)
    end
end
