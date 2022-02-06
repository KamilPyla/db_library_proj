class Role < ApplicationRecord
  has_many :employees, dependent: :destroy
end
