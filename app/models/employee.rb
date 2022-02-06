class Employee < ApplicationRecord
  # belongs_to :role, optional: true

  has_many :rents_out, class_name: 'Rent', foreign_key: 'employee_rent_id', dependent: :destroy
  has_many :rents_back, class_name: 'Rent', foreign_key: 'employee_return_id', dependent: :destroy

  def name
    "#{imie} #{nazwisko}"
  end

  def stanowisko
    role&.nazwa 
  end

  def role
    Role.where("id = #{role_id}").first
  end

  def rents_out
    Rent.where("employee_rent_id = #{id}")
  end

  def rents_back
    Rent.where("employee_rent_id = #{id}")
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
