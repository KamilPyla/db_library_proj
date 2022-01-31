class Reader < ApplicationRecord
  has_many :punishments

  def name
    "#{imie} #{nazwisko}"
  end
end
