class Book < ApplicationRecord
  belongs_to :autor
  belongs_to :category
  belongs_to :publisher
end
