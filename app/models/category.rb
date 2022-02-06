class Category < ApplicationRecord
  has_many :books, dependent: :destroy

  def books
    Book.where("category_id = #{id}")
  end
end
