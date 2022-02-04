class Publisher < ApplicationRecord
  has_many :books

  def books
    sql = "SELECT books.* FROM books WHERE books.publisher_id = #{id}"
    Book.find_by_sql(sql)
  end
end
