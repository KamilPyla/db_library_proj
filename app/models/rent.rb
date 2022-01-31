class Rent < ApplicationRecord
  belongs_to :book
  belongs_to :reader
  belongs_to :employee_rent, class_name: 'Employee', foreign_key: 'employee_rent_id'
  belongs_to :employee_return, class_name: 'Employee', foreign_key: 'employee_return_id'
end
