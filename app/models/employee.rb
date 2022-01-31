class Employee < ApplicationRecord
  belongs_to :role

  has_many :rents_out, class_name: 'Rent', foreign_key: 'employee_rent_id'
  has_many :rents_back, class_name: 'Rent', foreign_key: 'employee_return_id'

  def name
    "#{imie} #{nazwisko}"
  end

  def stanowisko
    role&.nazwa
  end
end
