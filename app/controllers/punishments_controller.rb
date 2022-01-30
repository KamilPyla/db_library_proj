class PunishmentsController < ApplicationController
  before_action :set_punishment, only: %i[ show edit update destroy ]

  # GET /punishments or /punishments.json
  def index
    @punishments = Punishment.all
  end

  # GET /punishments/1 or /punishments/1.json
  def show
  end

  # GET /punishments/new
  def new
    @punishment = Punishment.new
  end

  # GET /punishments/1/edit
  def edit
  end

  # POST /punishments or /punishments.json
  def create
    @punishment = Punishment.new(punishment_params)

    respond_to do |format|
      if @punishment.save
        format.html { redirect_to punishment_url(@punishment), notice: "Punishment was successfully created." }
        format.json { render :show, status: :created, location: @punishment }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @punishment.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /punishments/1 or /punishments/1.json
  def update
    respond_to do |format|
      if @punishment.update(punishment_params)
        format.html { redirect_to punishment_url(@punishment), notice: "Punishment was successfully updated." }
        format.json { render :show, status: :ok, location: @punishment }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @punishment.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /punishments/1 or /punishments/1.json
  def destroy
    @punishment.destroy

    respond_to do |format|
      format.html { redirect_to punishments_url, notice: "Punishment was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_punishment
      @punishment = Punishment.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def punishment_params
      params.require(:punishment).permit(:kwota)
    end
end
