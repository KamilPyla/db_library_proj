class Autor < ApplicationRecord
  has_many :books
  
  def name
    "#{imie} #{nazwisko}"
  end

  def books
    Book.where("autor_id = #{id}")
  end
end
