class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true

  # def self.all
  #   sql = "SELECT #{table_name}.* FROM #{table_name}"
  #   find_by_sql(sql)
  # end

  # def self.count
  #   sql = "SELECT COUNT(*) FROM #{table_name}"
  #   ActiveRecord::Base.connection.execute(sql).values[0][0]
  # end

end
