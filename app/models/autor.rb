class Autor < ApplicationRecord
  def name
    imie + ' ' + nazwisko
  end
end
