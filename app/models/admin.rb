class Admin < ApplicationRecord
  def authenticate(pass)
    password == pass
  end

  def admin?
    true
  end

  def reader?
    false
  end

  def employee?
    false
  end
end
