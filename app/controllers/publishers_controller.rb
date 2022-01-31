class PublishersController < ApplicationController
  before_action :set_publisher, only: %i[ show edit update destroy ]

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

    respond_to do |format|
      if @publisher.save
        format.html { redirect_to publisher_url(@publisher), notice: "Wydawnictwo zostało dodane pomyślnie." }
      else
        format.html { render :new, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @publisher.update(publisher_params)
        format.html { redirect_to publisher_url(@publisher), notice: "Dane wydawnictwa zostały zaukualizowane." }
      else
        format.html { render :edit, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @publisher.destroy

    respond_to do |format|
      format.html { redirect_to publishers_url, notice: "Wydawnictwo zostało usunięte." }
    end
  end

  private
    def set_publisher
      @publisher = Publisher.find(params[:id])
    end

    def publisher_params
      params.require(:publisher).permit(:nazwa)
    end
end
