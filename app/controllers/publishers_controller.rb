# frozen_string_literal: true

class PublishersController < ApplicationController
  before_action :set_publisher, only: %i[show edit update destroy]

  def index
    @publishers = Publisher.all
  end

  def show; end

  def new
    @publisher = Publisher.new
  end

  def edit; end

  def create
    @publisher = Publisher.new(publisher_params)

    if @publisher.save
      redirect_to publisher_url(@publisher), notice: 'Wydawnictwo zostało dodane pomyślnie.'
      render :new, status: :unprocessable_entity
    end
  end

  def update
    if @publisher.update(publisher_params)
      redirect_to publisher_url(@publisher), notice: 'Dane wydawnictwa zostały zaukualizowane.'
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @publisher.destroy
    redirect_to publishers_url, notice: 'Wydawnictwo zostało usunięte.'
  end

  private

  def set_publisher
    @publisher = Publisher.find(params[:id])
  end

  def publisher_params
    params.require(:publisher).permit(:nazwa)
  end
end
