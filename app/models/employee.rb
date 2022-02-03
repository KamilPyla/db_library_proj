class Employee < ApplicationRecord
  belongs_to :role, optional: true

  has_many :rents_out, class_name: 'Rent', foreign_key: 'employee_rent_id'
  has_many :rents_back, class_name: 'Rent', foreign_key: 'employee_return_id'

  def name
    "#{imie} #{nazwisko}"
  end

  def stanowisko
    role&.nazwa 
  end

  def authenticate(pass)
    haslo == pass
  end

  def admin?
    false
  end

  def reader?
    false
  end

  def employee?
    true
  end
end
