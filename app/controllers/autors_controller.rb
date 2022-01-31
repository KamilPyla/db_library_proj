class AutorsController < ApplicationController
  before_action :set_autor, only: %i[ show edit update destroy ]

  def index
    @autors = Autor.all
  end

  def show; end

  def new
    @autor = Autor.new
  end

  def edit; end

  def create
    @autor = Autor.new(autor_params)

    respond_to do |format|
      if @autor.save
        format.html { redirect_to autor_url(@autor), notice: "Autor został dodany pomyślnie" }
      else
        format.html { render :new, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @autor.update(autor_params)
        format.html { redirect_to autor_url(@autor), notice: "Dane Autora zostały zaktualizowane" }
      else
        format.html { render :edit, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @autor.destroy

    respond_to do |format|
      format.html { redirect_to autors_url, notice: "Autor został usunięty." }
    end
  end

  private
    def set_autor
      @autor = Autor.find(params[:id])
    end

    def autor_params
      params.require(:autor).permit(:imie, :nazwisko)
    end
end
