class ReadersController < ApplicationController
  before_action :set_reader, only: %i[ show edit update destroy ]

  def index
    @readers = Reader.all
  end

  def show; end

  def new
    @reader = Reader.new
  end

  def edit; end

  def create
    @reader = Reader.new(reader_params)

    respond_to do |format|
      if @reader.save
        format.html { redirect_to reader_url(@reader), notice: "Dodano czytelnika pomyślnie." }
      else
        format.html { render :new, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @reader.update(reader_params)
        format.html { redirect_to reader_url(@reader), notice: "Zaukualizowano dane czytelnika." }
      else
        format.html { render :edit, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @reader.destroy

    respond_to do |format|
      format.html { redirect_to readers_url, notice: "Usunięto czytelnika pomyślnie." }
    end
  end

  private
    def set_reader
      @reader = Reader.find(params[:id])
    end

    def reader_params
      params.require(:reader).permit(:imie, :nazwisko, :telefon, :data_urodzenia, :email, :haslo)
    end
end
