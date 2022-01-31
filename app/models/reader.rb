class Reader < ApplicationRecord
  has_many :punishments
  has_many :rents

  def name
    "#{imie} #{nazwisko}"
  end
end
