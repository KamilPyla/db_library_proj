class Reader < ApplicationRecord
  has_many :punishments
  has_many :rents

  # def rents
  #   sql = "SELECT rents.* FROM rents WHERE rents.reader_id = #{id}"
  #   Rent.find_by_sql(sql)
  # end

  # def punishments
  #   sql = "SELECT punishments.* FROM punishments WHERE punishments.reader_id = #{id}"
  #   Punishment.find_by_sql(sql)
  # end

  def punishment_sum
    sql = "SELECT SUM(kwota) FROM punishments WHERE punishments.reader_id = #{id}"
    ActiveRecord::Base.connection.execute(sql).values[0][0] || 0
  end
  
  def rents_sum
    sql = "SELECT COUNT(*) FROM rents WHERE rents.reader_id = #{id}"
    ActiveRecord::Base.connection.execute(sql).values[0][0] || 0
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
