class Reader < ApplicationRecord
  has_many :punishments
  has_many :rents

  scope :best_reader, -> do
    joins('JOIN rents on rents.reader_id = readers.id')
    .group('readers.id')
    .order('count(readers.id) DESC')
  end

  def rents
    Rent.where("reader_id = #{id}")
  end

  def punishments
    Punishment.where("reader_id = #{id}")
  end

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
