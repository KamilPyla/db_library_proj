class Reader < ApplicationRecord
  has_many :punishments
  has_many :rents

  def rents
    sql = "SELECT rents.* FROM rents WHERE rents.reader_id = #{id}"
    Rent.find_by_sql(sql)
  end

  def punishments
    sql = "SELECT punishments.* FROM punishments WHERE punishments.reader_id = #{id}"
    Punishment.find_by_sql(sql)
  end

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
