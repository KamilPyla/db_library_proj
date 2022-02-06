class Publisher < ApplicationRecord
  has_many :books, dependent: :destroy

  def books
    Book.where("publisher_id = #{id}").first
  end
end
