class Employee < ApplicationRecord
  belongs_to :role

  def name 
    "#{imie} #{nazwisko}"
  end

  def stanowisko
    role.nazwa if role
  end
end
