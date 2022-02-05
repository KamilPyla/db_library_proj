class Category < ApplicationRecord
  has_many :books

  def books
    Book.where("category_id = #{id}")
  end
end
