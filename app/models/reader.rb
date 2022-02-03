class Reader < ApplicationRecord
  has_many :punishments
  has_many :rents

  def name
    "#{imie} #{nazwisko}"
  end
  
  def authenticate(pass)
    haslo == pass
  end

  def admin?
    false
  end

  def reader?
    true
  end

  def employee?
    false
  end
end
