class Autor < ApplicationRecord
  has_many :books
  
  def name
    "#{imie} #{nazwisko}"
  end
end
