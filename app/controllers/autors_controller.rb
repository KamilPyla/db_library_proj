# frozen_string_literal: true

class AutorsController < ApplicationController
  before_action :set_autor, only: %i[show edit update destroy]

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

    if @autor.save
      redirect_to autor_url(@autor), notice: 'Autor został dodany pomyślnie'
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    if @autor.update(autor_params)
      redirect_to autor_url(@autor), notice: 'Dane Autora zostały zaktualizowane'
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @autor.destroy
    redirect_to autors_url, notice: 'Autor został usunięty.'
  end

  private

  def set_autor
    @autor = Autor.find(params[:id])
  end

  def autor_params
    params.require(:autor).permit(:imie, :nazwisko)
  end
end
