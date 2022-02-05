class Publisher < ApplicationRecord
  has_many :books

  def books
    Book.where("publisher_id = #{id}").first
  end
end
