class Employee < ApplicationRecord
  belongs_to :role

  def stanowisko
    role.nazwa if role
  end
end
