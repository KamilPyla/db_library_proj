# frozen_string_literal: true

class CategoriesController < ApplicationController
  before_action :set_category, only: %i[show edit update destroy]

  def index
    @categories = Category.all
  end

  def new
    @category = Category.new
  end

  def edit; end

  def create
    @category = Category.new(category_params)

    if @category.save
      redirect_to category_url(@category), notice: 'Kategoria została dodana pomyślnie'
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    if @category.update(category_params)
      redirect_to category_url(@category), notice: 'Kategoria została zaukualizowana.'
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @category.destroy

    redirect_to categories_url, notice: 'Usunięto kategorie pomyślnie.'
  end

  private

  def set_category
    @category = Category.find_by(id: params[:id])
  end

  def category_params
    params.require(:category).permit(:nazwa)
  end
end
